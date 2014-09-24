class CreatePaymentCoupons < ActiveRecord::Migration
  def change
    create_table :payment_coupons do |t|
      t.references :user, index: true
      t.string :code
      t.decimal :price, :precision => 8, :scale => 2
      t.string :message
      t.string :status, default: 'active'
      t.integer :actived_by
      t.integer :actived_site_id
      t.string :note

      t.timestamps
    end
    add_index :payment_coupons, :code, unique: true
    add_index :payment_coupons, :actived_by
    add_index :payment_coupons, :actived_site_id
  end
end
