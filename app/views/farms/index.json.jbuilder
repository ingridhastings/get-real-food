json.array!(@farms) do |farm|
  json.extract! farm, :id, :name, :address, :description, :phone, :website, :user_id
  json.url farm_url(farm, format: :json)
end
