json.extract! user, :id, :name, :email, :registration, :score, :created_at, :updated_at
json.url user_url(user, format: :json)
