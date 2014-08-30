# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pomodoro do
    title "Task"
    started_at Date.today
    finished_at Date.today
    interrupted_at nil
    user nil
  end
end
