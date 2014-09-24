class Site < ActiveRecord::Base
  belongs_to :template
  belongs_to :user
  has_many :site_images, :dependent => :destroy
  has_many :site_comments, :dependent => :destroy
  has_many :site_pages, :dependent => :destroy
  has_many :site_sections, :dependent => :destroy
  before_create :create_unique_key
  after_create :generate_html

  #thief: bad user, bad site -> not allow showing in case and template
  #recommend: good site -> show in template 
  #vip: payed site -> not show in case (if user ask for)
  #vip-recommend -> vip and can show in template examples
  STATUS = %w(nopay thief vip vip-recommend)

  def save_all
    ActiveRecord::Base.transaction do
      self.save
      #init required sections 
      self.template.init_section_keys.split('|').each do |key|
        section = Section.find_by(template_id: self.template.id, key: key.strip.downcase)
        next if section.nil?
        SiteSection.create!(
          site_id: self.reload.id,
          section_id: section.id,
          html: section.html
        )
      end
    end
    return true
  end
  private
    def create_unique_key
      begin
        self.key = SecureRandom.hex(2)
      end while self.class.exists?(:key => key)
    end

    #only init html on first create
    def generate_html
      self.html = self.template.html
      self.save!
    end
end
