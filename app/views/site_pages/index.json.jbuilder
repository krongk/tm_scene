json.array!(@site_pages) do |site_page|
  json.extract! site_page, :id, :site_id, :key, :title, :keywords, :description, :content
  json.url site_page_url(site_page, format: :json)
end
