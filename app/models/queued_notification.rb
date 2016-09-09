class QueuedNotification < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :activity, class_name: PublicActivity::Activity

  scope :pending, -> { where(delivered: false) }

  enum period: Subscription::MODES

  def self.queue(attributes)
    if attributes[:period] == 'live'
      process attributes
    else
      create attributes
    end
  end

  def self.process(attributes)
    activity = attributes[:activity]
    user = attributes[:user]

    if activity.trackable_type == "Reason"
      reason = activity.trackable
      if activity.key == "reason.vote"
        UserMailer.new_vote_on_your_reason(user, reason).deliver_later
      elsif activity.key == "create"
        UserMailer.new_reason_on_your_issue(user, reason.issue, reason.title).deliver_later
      end
    end
  end

  def self.process_queued(period)
    pending.where(period: period).group_by(&:user_id).each do |user_id, queued_notifications|
      user = User.find(user_id)
      digest_messages = []
      queued_notifications.each do |qn|
        digest_messages.push qn.digest_message
      end
      digest_messages.compact!

      if digest_messages.any?
        UserMailer.new_notifications_digest(user, digest_messages, period).deliver_now
      end

      queued_notifications.each do |qn|
        qn.mark_as_delivered!
      end
    end
  end

  def mark_as_delivered!
    update_column :delivered, true
  end

  def digest_message
    if activity.trackable_type == "Reason"
      reason = activity.trackable
      if activity.key == "reason.vote"
        " - #{I18n.t('queued_notifications.digest_messages.reason_voted', reason_title: reason.title, reason_url: issue_reason_url(reason.issue, reason))}"
      elsif activity.key == "reason.create"
        " - #{I18n.t('queued_notifications.digest_messages.reason_created', issue_title: reason.issue.title,  reason_title: reason.title, issue_url: issue_url(reason.issue))}"
      end
    end
  end
end
