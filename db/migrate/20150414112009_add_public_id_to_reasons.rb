class AddPublicIdToReasons < ActiveRecord::Migration
  def change
    add_column :reasons, :public_id, :integer, default: 1
    add_index :reasons, :public_id
    
    # reset public ids
    # moved to rake task: reset_public_ids

  end
end
