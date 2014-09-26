json.array!(@pictures) do |picture|
  json.extract! picture, :id, :user_id, :gallery_id, :name, :key
  json.url picture_url(picture, format: :json)
end
