class SiteImage < ActiveRecord::Base
  belongs_to :site
  belongs_to :site_section

  before_create :create_unique_key
  private
    def create_unique_key
      begin
        self.key = SecureRandom.hex(2)
      end while self.class.exists?(:key => key)
    end
end
