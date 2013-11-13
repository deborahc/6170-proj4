json.array!(@supervisors) do |supervisor|
  json.extract! supervisor, 
  json.url supervisor_url(supervisor, format: :json)
end
