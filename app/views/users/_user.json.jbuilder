json.extract! user, :id, :name_user, :email, :phone, :cpf, :gender, :profile, :created_at, :updated_at
json.url user_url(user, format: :json)
