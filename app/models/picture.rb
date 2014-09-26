class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :gallery

  has_attached_file :asset,
                    :path => ":class/:id/:style.:extension",
                    :styles => {:original => '640x960>'} #override the original file

  validates_attachment_size :asset, :less_than => 5.megabytes
  validates_attachment_content_type :asset, :content_type => /\Aimage\/.*\Z/
end
