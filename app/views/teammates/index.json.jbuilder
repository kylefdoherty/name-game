json.array!(@teammates) do |teammate|
  json.extract! teammate, :id, :image, :name, :team, :title
  json.url teammate_url(teammate, format: :json)
end
