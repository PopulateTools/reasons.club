class AddUserRefToIssues < ActiveRecord::Migration
  def change
    add_reference :issues, :user, index: true
    add_foreign_key :issues, :users
  end
end
