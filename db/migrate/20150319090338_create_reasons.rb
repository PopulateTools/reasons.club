class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.string :title
      t.string :slug
      t.boolean :for, default:true

      t.timestamps null: false
    end
    add_index :reasons, :slug, unique: true
  end
end
