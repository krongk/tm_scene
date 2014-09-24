class CreateSitePages < ActiveRecord::Migration
  def change
    create_table :site_pages do |t|
      t.references :site, index: true
      t.string :key
      t.string :title
      t.string :keywords
      t.string :description
      t.text :content

      t.timestamps
    end
    add_index :site_pages, :key, unique: true
  end
end
