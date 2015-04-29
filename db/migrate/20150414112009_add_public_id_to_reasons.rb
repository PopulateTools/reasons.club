class AddPublicIdToReasons < ActiveRecord::Migration
  def change
    add_column :reasons, :public_id, :integer, default: 1
    add_index :reasons, :public_id
    
    # reset public ids
    # moved to rake task: reset_public_id
    Issue.all.each do |i|
      i.reasons.first.public_id = '1'
      i.reasons.all.each do |r|
        r.set_public_id
      end
    end

  end
end
