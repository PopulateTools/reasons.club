class AddEmailSubscriptionModeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_subscription_mode, :integer, default: 0, :null => false
  end
end
