class CreateQueuedNotifications < ActiveRecord::Migration
  def change
    create_table :queued_notifications do |t|
      t.references :user, index: true
      t.text :notification
      t.integer :period, index: true
      t.boolean :delivered, index: true, default: false
      t.index [:period, :delivered]
      t.timestamps
    end
    add_foreign_key :queued_notifications, :users
  end
end
