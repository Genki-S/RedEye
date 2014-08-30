class Pomodoro < ActiveRecord::Base
  belongs_to :user

  has_one :reflection
end
