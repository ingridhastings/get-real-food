json.array!(@farms) do |farm|
  json.extract! farm, :id, :name, :address, :website, :user_id
  json.url farm_url(farm, format: :json)
end
