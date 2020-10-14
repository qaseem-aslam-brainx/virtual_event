class EventTime < ApplicationRecord
  belongs_to :event
  validates :date, :time_end, :time_start, presence: true
end
