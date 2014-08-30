class CreateInterruptions < ActiveRecord::Migration
  def change
    create_table :interruptions do |t|
      t.integer :pomodoro_id
      t.text :reason

      t.timestamps
    end
  end
end
