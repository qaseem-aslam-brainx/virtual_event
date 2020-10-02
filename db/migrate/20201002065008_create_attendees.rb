class CreateAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :attendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :resume
      t.integer :phone_no
      t.boolean :veteran
      t.string :certifications
      t.string :education
      t.string :reference

      t.timestamps
    end
  end
end
