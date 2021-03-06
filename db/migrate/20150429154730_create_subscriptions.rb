class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true
      t.references :issue, index: true
      t.integer :email_subscription_mode
      t.timestamps
    end
    add_foreign_key :subscriptions, :users
    add_foreign_key :subscriptions, :issues
  end
end
