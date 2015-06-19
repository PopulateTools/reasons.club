class AddEmailSubscriptionModeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_subscription_mode, :string, default: :hourly, :null => false
  end
end
