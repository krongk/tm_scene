#encoding: utf-8
class SController < ApplicationController
  # layout 'simple' 其实这里不用统一一个layout, 直接render到模板即可
  include SHelper

  #/s/:site_id(/p-:id)
  def index
    @site = Site.find_by(key: params[:site_id])
    not_found if @site.nil?
   
    render inline: @site.html, layout: false
  end

  def preview
    @site = Site.find_by(key: params[:site_id])
    not_found if @site.nil?
  end

end
