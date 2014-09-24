class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.references :cate, index: true
      t.string :title
      t.decimal :price, :precision => 8, :scale => 2
      t.string :init_section_keys, default: 'header|placeholder|footer'
      t.text :html
      t.text :form

      t.timestamps
    end
    add_index :templates, :title, unique: true
  end
end
