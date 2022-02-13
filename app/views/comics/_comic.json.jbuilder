json.extract! comic, :id, :title, :body, :user_id, :created_at, :updated_at
json.url comic_url(comic, format: :json)
