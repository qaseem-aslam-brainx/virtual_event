class CreateSponsors < ActiveRecord::Migration[6.0]
  def change
    create_table :sponsors do |t|
      t.string :logo
      t.string :name
      t.string :website
      t.integer :status
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
