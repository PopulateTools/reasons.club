class ChangePrivacyPublicToIssues < ActiveRecord::Migration
  def change
    change_column :issues, :privacy_public, :string
    change_column_default :issues, :privacy_public, 0
  end
end
