class AddPublicIdToReasons < ActiveRecord::Migration
  def change
    add_column :reasons, :public_id, :integer, default: 1
    add_index :reasons, :public_id
  end
end
