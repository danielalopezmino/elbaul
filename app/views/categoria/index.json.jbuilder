json.array!(@categoria) do |categorium|
  json.extract! categorium, :id, :nombre, :orden, :foto_url
  json.url categorium_url(categorium, format: :json)
end
