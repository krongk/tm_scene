class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :user, index: true
      t.string :name
    end
  end
end
