class QueuedNotification < ActiveRecord::Base

  # belongs_to :issue
  belongs_to :user

  enum period: [ :live, :hourly, :daily, :no_mail]

end
