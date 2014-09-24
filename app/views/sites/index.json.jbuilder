json.array!(@sites) do |site|
  json.extract! site, :id, :template_id, :key, :status, :title, :description, :preview_image_key, :is_private, :private_password, :html
  json.url site_url(site, format: :json)
end
