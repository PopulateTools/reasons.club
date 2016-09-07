class ConvertPrivacyPublicToInteger < ActiveRecord::Migration
  def up
    execute "ALTER TABLE issues ALTER privacy_public DROP DEFAULT;"
    change_column :issues, :privacy_public, 'integer USING privacy_public::integer', default: 0, null: false
  end

  def down
    execute "ALTER TABLE issues ALTER privacy_public DROP DEFAULT;"
    change_column :issues, :privacy_public, :string
  end
end
