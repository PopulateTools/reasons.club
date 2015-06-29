class Subscription < ActiveRecord::Base

  # This order shouldn't be updated
  MODES = [ :hourly, :daily, :no_mail, :live ]

  belongs_to :issue
  belongs_to :user

  before_validation :set_email

  enum email_subscription_mode: Subscription::MODES

  def self.subscribe_to(user, issue)
    unless user.subscriptions.where(issue: issue).any?
      create! user: user, issue: issue
    end
  end

  def self.queue_notifications_for(issue, activity)
    where(issue: issue).where.not(user: activity.owner).each do |subscription|
      QueuedNotification.create user: subscription.user, notification: activity.id,
                                period: subscription.user.email_subscription_mode, status: 0
    end
  end

  private

    def set_email
      self.email_subscription_mode = self.user.email_subscription_mode
    end

end
