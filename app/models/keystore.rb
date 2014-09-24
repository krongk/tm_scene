class Keystore < ActiveRecord::Base
  validates :obj_type, :obj_id, :key, presence: true

  def self.get(obj, key_name)
    self.find_by(obj_type: obj.class.to_s, obj_id: obj.id, key: key_name)
  end

  def self.put(obj, key_name, value)
    return drop(obj, key_name) if value.blank?
    ks = self.find_or_create_by(obj_type: obj.class.to_s, obj_id: obj.id, key: key_name)
    ks.value = value
    ks.save!
    true
  end

  def self.drop(obj, key_name)
    ks = self.find_by(obj_type: obj.class.to_s, obj_id: obj.id, key: key_name)
    ks.destroy if ks
    true
  end

  #call on application_helper.rb
  #Keystore.value_for(@site_page, 'title', type: 'string', default: true, required: true) 
  #the [opt] is used for generate form
  def self.value_for(obj, key_name, opt={})
    self.get(obj, key_name).try(:value)
  end
end
