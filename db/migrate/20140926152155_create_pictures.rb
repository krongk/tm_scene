class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :user, index: true
      t.references :gallery, index: true
      t.string :name
      t.string :key
      t.attachment :asset
      t.timestamps
    end
  end
end
