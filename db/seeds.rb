# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

my_uid = '681364011953743'
me = User.create(name: 'Genki Sugimoto', provider: 'facebook', uid: my_uid)

now = Time.parse('08:00')

(1..10).each do |i|
  start_time = now + i.hour
  finish_time = start_time + 25.minutes
  p = Pomodoro.create(title: "Task #{i}", started_at: start_time, finished_at: finish_time)

  evaluation = [-1, 0, 1].shuffle.first
  r = Reflection.create(evaluation: evaluation)

  p.user = me
  p.reflection = r
  p.save
end
