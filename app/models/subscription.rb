class Subscription < ActiveRecord::Base

  belongs_to :issue
  belongs_to :user

  before_validation :set_email

  private

    def set_email
      self.email_subscription_mode = user.email_subscription_mode 
    end

end
