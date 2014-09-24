class CreateKeystores < ActiveRecord::Migration
  def change
    create_table :keystores do |t|
      t.string :obj_type
      t.integer :obj_id
      t.string :key
      t.string :value
    end
    add_index :keystores, [:obj_type, :obj_id, :key], unique: true
  end
end
