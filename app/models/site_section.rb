class SiteSection < ActiveRecord::Base
  belongs_to :site
  belongs_to :section

  #init position
  before_create :assign_position
  def assign_position
    last_section = SiteSection.where(site_id: self.site_id).order("position ASC").last
    if last_section.nil?
      self.position = 1
    else
      self.position = last_section.position.to_i + 1
    end
  end

end
