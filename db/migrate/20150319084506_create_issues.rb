class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.string :locale
      t.boolean :privacy_public, default: false
      t.string :slug, unique: true, index: true

      t.timestamps null: false

    end
  end
end
