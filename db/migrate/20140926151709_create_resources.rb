class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :user, index: true
      t.string :typo
      t.string :name
      t.attachment :asset
      t.timestamps
    end
  end
end
