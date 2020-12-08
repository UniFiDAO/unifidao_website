json.extract! email_link, :id, :token, :expires_at, :user_id, :created_at, :updated_at
json.url email_link_url(email_link, format: :json)
