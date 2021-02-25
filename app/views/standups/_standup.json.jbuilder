json.extract! standup, :id, :user_id, :standup_date, :created_at, :updated_at
json.url standup_url(standup, format: :json)
