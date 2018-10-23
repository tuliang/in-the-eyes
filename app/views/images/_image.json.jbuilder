json.extract! image, :id, :title, :image_type, :created_at, :updated_at
json.url image_url(image, format: :json)
