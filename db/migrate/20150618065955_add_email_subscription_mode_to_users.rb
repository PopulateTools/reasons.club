class AddEmailSubscriptionModeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_subscription_mode, :integer, :default => :hourly
  end
end
