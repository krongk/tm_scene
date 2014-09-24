json.array!(@site_sections) do |site_section|
  json.extract! site_section, :id, :site_id, :section_id, :position, :html
  json.url site_section_url(site_section, format: :json)
end
