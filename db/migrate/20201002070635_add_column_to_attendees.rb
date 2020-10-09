class AddColumnToAttendees < ActiveRecord::Migration[6.0]
  def change
    add_reference :attendees, :event, null: false, foreign_key: true
  end
end
