class Template < ActiveRecord::Base
  belongs_to :cate
  has_many :sections
end
