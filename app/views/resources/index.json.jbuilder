json.array!(@resources) do |resource|
  json.extract! resource, :id, :user_id, :typo, :name
  json.url resource_url(resource, format: :json)
end
