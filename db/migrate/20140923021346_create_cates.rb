class CreateCates < ActiveRecord::Migration
  def change
    create_table :cates do |t|
      t.string :name
    end
    add_index :cates, :name, unique: true
  end
end
