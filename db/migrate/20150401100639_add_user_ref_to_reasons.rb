class AddUserRefToReasons < ActiveRecord::Migration
  def change
    add_reference :reasons, :user, index: true
    add_foreign_key :reasons, :users
  end
end
