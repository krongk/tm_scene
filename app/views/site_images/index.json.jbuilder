json.array!(@site_images) do |site_image|
  json.extract! site_image, :id, :site_id, :site_section_id, :key, :name, :image, :image_file_name, :image_file_size, :image_content_type
  json.url site_image_url(site_image, format: :json)
end
