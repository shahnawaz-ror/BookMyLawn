json.extract! gallery, :id, :image, :active, :description, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
