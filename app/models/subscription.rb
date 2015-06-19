class Subscription < ActiveRecord::Base

  belongs_to :issue
  belongs_to :user

  # ToReview: I can't get the system to save this properly, it always save 0 as the value
  before_validation :set_email

  private

    def set_email
      self.email_subscription_mode = user[:email_subscription_mode]
    end

end
