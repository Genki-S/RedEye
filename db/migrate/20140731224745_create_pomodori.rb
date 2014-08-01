class CreatePomodori < ActiveRecord::Migration
  def change
    create_table :pomodori do |t|
      t.string :title
      t.datetime :started_at
      t.datetime :finished_at
      t.datetime :interrupted_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
