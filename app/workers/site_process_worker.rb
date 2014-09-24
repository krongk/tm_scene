# to extact title, meta keywords from site domain
# http://nokogiri.org/
require 'nokogiri'
require 'open-uri'

class SiteProcessWorker
  include Sidekiq::Worker

  def perform(site_id)
    flag = 'y'
    puts "process site: #{site_id}"
    site = Site.find(site_id)
    url = "http://#{site.domain}"
    begin
      doc = Nokogiri::HTML(open(url))
    rescue => ex
      flag = ex.message
    end
    return if doc.nil?

    begin
      site.title = doc.at('title').text
      site.keywords = doc.at('meta[name=keywords]').attr('content')
      site.description = doc.at('meta[name=description]').attr('content')
    rescue => ex
      flag += ex.message
    end

    site.is_processed = flag
    site.save!
    puts "done for process site: #{site.id}"
  end
end
