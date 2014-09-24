class CreatePaymentTokens < ActiveRecord::Migration
  def change
    create_table :payment_tokens do |t|
      t.references :user, index: true
      t.string :code
      t.string :status, default: 'active'
      t.string :note
      t.integer :actived_by
      t.integer :actived_site_id

      t.timestamps
    end
    add_index :payment_tokens, :code, unique: true
    add_index :payment_tokens, :actived_by
    add_index :payment_tokens, :actived_site_id
  end
end
