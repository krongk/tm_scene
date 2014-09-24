class CreateSiteImages < ActiveRecord::Migration
  def change
    create_table :site_images do |t|
      t.references :site, index: true
      t.references :site_section, index: true
      t.string :key
      t.string :name
      t.string :image
      t.string :image_file_name
      t.string :image_file_size
      t.string :image_content_type

      t.timestamps
    end
    add_index :site_images, :key, unique: true
  end
end
