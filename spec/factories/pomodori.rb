# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pomodoro do
    title "MyString"
    started_at "2014-08-01 07:47:45"
    finished_at "2014-08-01 07:47:45"
    interrupted_at "2014-08-01 07:47:45"
    user nil
  end
end
