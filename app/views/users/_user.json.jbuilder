json.extract! user, :id, :uid, :name, :email, :avatar, :created_at, :updated_at
json.url user_url(user, format: :json)
