class AddPublicIdToReasons < ActiveRecord::Migration
  def change
    add_column :reasons, :public_id, :integer, default: 1
    add_index :reasons, :public_id
    # Reason.all.each { |r| r.update_attributes(:public_id => r.set_public_id) }
  end
end
