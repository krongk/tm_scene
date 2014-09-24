class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.references :template, index: true
      t.string :key
      t.string :status, default: 'nopay'
      t.string :title
      t.string :description
      t.string :preview_image_key
      t.boolean :is_private, default: false
      t.string :private_password
      t.text :html

      t.timestamps
    end
    add_index :sites, :key, unique: true
  end
end
