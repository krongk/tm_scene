class CreatePageTemplates < ActiveRecord::Migration
  def change
    create_table :page_templates do |t|
      t.string :title
      t.string :preview_image
      t.text :html

      t.timestamps
    end
    add_index :page_templates, :title, unique: true
  end
end
