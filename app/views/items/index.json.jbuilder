json.array!(@items) do |item|
  json.extract! item, :id, :name, :place, :status, :number, :unit_id, :description, :image, :updated_date, :updated_person_id
  json.url item_url(item, format: :json)
end
