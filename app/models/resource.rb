class Resource < ActiveRecord::Base
  belongs_to :user

  has_attached_file :asset,
                    :path => ":class/:id/:style.:extension"

  validates_attachment_size :asset, :less_than => 100.megabytes
end
