json.array!(@pomodori) do |pomodoro|
  json.extract! pomodoro, :id, :title, :started_at, :finished_at, :interrupted_at, :user_id
  json.url pomodoro_url(pomodoro, format: :json)
end
