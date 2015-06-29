class QueuedNotification < ActiveRecord::Base

  belongs_to :user

  enum period: Subscription::MODES

end
