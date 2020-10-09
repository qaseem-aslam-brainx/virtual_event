class Event < ApplicationRecord
  # Constants

  # Attributes

  # Extensions
  enum status: [ :active, :deactive ]

  # Relationships
  belongs_to :user
  has_many :sponsors
  has_many :attendees

  # Validations
  validates :title, :logo, :date, :time_start, :time_end, presence: true

  # Scopes

  # Callbacks

  # Class Methods

  # Instance Methods

end
