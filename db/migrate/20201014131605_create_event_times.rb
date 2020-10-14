class CreateEventTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :event_times do |t|
      t.date :date
      t.time :time_start
      t.time :time_end
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
