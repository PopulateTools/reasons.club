class AddFeaturedToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :featured, :integer, default: 0
  end
end
