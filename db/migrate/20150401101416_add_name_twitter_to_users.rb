class AddNameTwitterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :twitter_handle, :string
  end
end
