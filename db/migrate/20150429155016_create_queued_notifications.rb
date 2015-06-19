class CreateQueuedNotifications < ActiveRecord::Migration
  def change
    create_table :queued_notifications do |t|
      t.references :user, index: true
      t.text :notification
      t.string :period, index: true
      t.boolean :status, index: true
      t.index [:period, :status]
      t.timestamps
    end
    add_foreign_key :queued_notifications, :users
  end
end
