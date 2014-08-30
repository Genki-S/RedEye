class CreateReflections < ActiveRecord::Migration
  def change
    create_table :reflections do |t|
      t.integer :pomodoro_id
      t.integer :evaluation

      t.timestamps
    end
  end
end
