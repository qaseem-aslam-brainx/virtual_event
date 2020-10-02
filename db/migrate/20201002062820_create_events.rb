class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :logo
      t.string :title
      t.date :date
      t.time :time_start
      t.time :time_end
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
