class Event < ApplicationRecord
  belongs_to :user
  has_many :sponsors
  enum status: [ :active, :deactive ]
  has_many :attendees
  validates :title, :logo, :date, :time_start, :time_end, presence: true
end
