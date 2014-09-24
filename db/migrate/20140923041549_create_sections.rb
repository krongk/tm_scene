class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :template, index: true
      t.string :key
      t.string :title
      t.string :description
      t.string :preview_image
      t.string :typo, default: 'image'
      t.boolean :is_repeat, default: false
      t.text :html
      t.text :form

      t.timestamps
    end
    add_index :sections, :key, unique: true
  end
end
