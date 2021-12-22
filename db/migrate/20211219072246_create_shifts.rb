class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|

      t.integer "team_id"
      t.integer "user_id"
      t.datetime "start_time"
      t.datetime "end_time"
      t.date "date"
      t.string "week_day"
      t.string "name"

      t.timestamps
    end
  end
end
