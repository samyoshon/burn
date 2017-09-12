json.extract! image, :id, :created_at, :updated_at
json.image_url image.image.url
json.url product_image_url(@product, image, format: :json)
