class CreateSiteComments < ActiveRecord::Migration
  def change
    create_table :site_comments do |t|
      t.references :site, index: true
      t.string :name
      t.string :mobile_phone
      t.string :tel_phone
      t.string :email
      t.string :qq
      t.string :weixin
      t.string :state
      t.string :city
      t.string :district
      t.string :address
      t.string :gender
      t.string :birth
      t.string :hobby
      t.string :content
      t.string :content2
      t.string :content3
      t.string :status
      t.string :updated_by
      t.string :note

      t.timestamps
    end
  end
end
