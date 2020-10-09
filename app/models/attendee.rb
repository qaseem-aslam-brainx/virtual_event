class Attendee < ApplicationRecord
  # Constants

  # Attributes

  # Extensions

  # Relationships
  belongs_to :event

  # Validations
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone_no, uniqueness: true
  # Scopes

  # Callbacks

  # Class Methods

  # Instance Methods

end
