class Subscription < ActiveRecord::Base

  MODES = {
    hourly: 0, daily: 1, no_mail: 2, live: 3
  }

  belongs_to :issue
  belongs_to :user

  before_create :set_email_subscription_mode

  scope :by_user, ->(user) { where(user_id: user.id) }
  scope :by_issue, ->(issue) { where(issue_id: issue.id) }
  scope :queueable, -> { where(email_subscription_mode: queueable_modes) }

  enum email_subscription_mode: MODES

  def self.queueable_modes
    [self.email_subscription_modes[:hourly], self.email_subscription_modes[:daily], self.email_subscription_modes[:live]]
  end

  def self.subscribe_to(user, issue)
    find_or_create_by user: user, issue: issue
  end

  def self.queue_notifications_for(issue, activity)
    queueable.by_issue(issue).where.not(user: activity.owner).each do |subscription|
      QueuedNotification.queue user: subscription.user, activity: activity,
                               period: subscription.email_subscription_mode
    end
  end

  private

  def set_email_subscription_mode
    self.email_subscription_mode = self.user.email_subscription_mode
  end

end
