class Event < ApplicationRecord
  belongs_to :user
  has_many :sponsors
  validates :title, :logo, :date, :time_start, :time_end, presence: true
end
