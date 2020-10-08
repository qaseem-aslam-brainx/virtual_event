class Event < ApplicationRecord
  belongs_to :user
  has_many :sponsors
  enum status: [ :active, :deactive ]
  validates :title, :logo, :date, :time_start, :time_end, presence: true
end
