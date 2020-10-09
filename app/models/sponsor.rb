class Sponsor < ApplicationRecord
  # Constants
  enum status: [ :active, :deactive ]

  # Attributes

  # Extensions

  # Relationships
  belongs_to :event

  # Validations
  validates :name, :logo, :website, :status, presence: true
  validates :website, format:
    { with: /(((http|https):\/\/|)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?)\z/i },
            unless: Proc.new { |a| a.website.blank? }

  # Scopes

  # Callbacks

  # Class Methods

  # Instance Methods

end
