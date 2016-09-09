class Subscription < ActiveRecord::Base

  MODES = {
    hourly: 0, daily: 1, no_mail: 2, live: 3
  }

  belongs_to :issue
  belongs_to :user

  before_create :set_email_subscription_mode

  scope :by_user, ->(user) { where(user_id: user.id) }
  scope :by_issue, ->(issue) { where(issue_id: issue.id) }

  enum email_subscription_mode: MODES

  def self.subscribe_to(user, issue)
    unless user.subscriptions.where(issue: issue).any?
      create! user: user, issue: issue
    end
  end

  def self.queue_notifications_for(issue, activity)
    where(issue: issue).where.not(user: activity.owner).each do |subscription|
      QueuedNotification.create user: subscription.user, notification: activity.id,
                                period: subscription.user.email_subscription_mode
    end
  end

  private

    def set_email_subscription_mode
      self.email_subscription_mode = self.user.email_subscription_mode
    end

end
