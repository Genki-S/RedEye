class Pomodoro < ActiveRecord::Base
  belongs_to :user

  has_one :reflection
  has_one :interruption

  scope :started_on, ->(date) { where('started_at BETWEEN ? AND ?', date.beginning_of_day, date.end_of_day) }
end
