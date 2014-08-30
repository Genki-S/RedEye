# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interruption do
    pomodoro_id 1
    reason "MyText"
  end
end
