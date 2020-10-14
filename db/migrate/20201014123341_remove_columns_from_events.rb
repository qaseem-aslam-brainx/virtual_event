class RemoveColumnsFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :date, :date
    remove_column :events, :time_start, :time
    remove_column :events, :time_end, :time
  end
end
