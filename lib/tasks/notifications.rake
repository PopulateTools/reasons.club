namespace :notifications do
  desc 'Run hourly notifications'
  task deliver_hourly_notifications: :environment do
    QueuedNotification.process_queued Subscription.email_subscription_modes[:hourly]
  end

  desc 'Run daily notifications'
  task deliver_daily_notifications: :environment do
    QueuedNotification.process_queued Subscription.email_subscription_modes[:daily]
  end
end
