class CreateSiteSections < ActiveRecord::Migration
  def change
    create_table :site_sections do |t|
      t.references :site, index: true
      t.references :section, index: true
      t.integer :position, default: 0
      t.text :html

      t.timestamps
    end
  end
end
