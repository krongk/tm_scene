class Section < ActiveRecord::Base
  belongs_to :template
  has_many :site_sections
  before_save :generate_form

  #不同的类型将有不同的图标显示
  TYPOS = %w(text image video audio gallery html)
end
