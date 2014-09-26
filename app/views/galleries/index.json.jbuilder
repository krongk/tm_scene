json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :user_id, :name
  json.url gallery_url(gallery, format: :json)
end
