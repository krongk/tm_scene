module ApplicationHelper
  SITE_KEYWORDS = %w{
    摩适配
    手机网站适配
    电脑网站转手机网站
    响应式网站
    适配微网站
  }.join(', ')
  
  def title(page_title)
    content_for(:title){ page_title}
    return page_title
  end
  def meta_keywords(meta_keywords)
    content_for(:meta_keywords){ meta_keywords}
  end
  def meta_description(meta_description)
    content_for(:meta_description){ meta_description}
  end
   def page_header(page_header)
    content_for(:page_header) do 
      %{
      <div class='row'>
        <div class='col-sm-12'>
          <div class='page-header'>
            <h1 class='pull-left'>
              <i class='icon-tint'></i>
              <span>#{page_header}</span>
            </h1>
            <div class='pull-right'>
              <ul class='breadcrumb'>
                <li>
                  <a href='/sites'>
                    <i class='icon-bar-chart'></i>
                  </a>
                </li>
                <li class='separator'>
                  <i class='icon-angle-right'></i>
                </li>
                <li>
                  应用管理后台
                </li>
                <li class='separator'>
                  <i class='icon-angle-right'></i>
                </li>
                <li class='active'><a href="/">返回到前台</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      }.html_safe
    end
    return page_header
  end

  #used in visitors_controller and site_contacts_controller
  def get_site(url)
    domain = URI.parse(url).hostname
    return nil if domain.nil?
    site = Site.find_by(domain: domain)
    return site unless site.nil?

    site = Site.new
    site.domain = domain
    site.save!
    site.reload
    #send notice to admin
    if Rails.env == 'production'
      SiteProcessWorker.perform_async(site.id)
    end
    return site
  end

  #Keystore.value_for(@site_page, 'text1')
  def value_for(obj, name, title, attr={})
    Keystore.value_for(obj, name, attr).try(:html_safe)
  end
end
