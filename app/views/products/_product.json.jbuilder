json.extract! product, :id, :text, :group_id, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)