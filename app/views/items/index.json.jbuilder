json.array!(@items) do |item|
  json.extract! item, :id, :name, :category_id, :place, :status, :number, :unit_id, :description, :image
  json.url item_url(item, format: :json)
end
