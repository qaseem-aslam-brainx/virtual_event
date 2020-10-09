class Event < ApplicationRecord
  # Constants

  # Attributes

  # Extensions
  enum status: [:active, :deactive]

  # Relationships
  belongs_to :user
  has_many :sponsors
  has_many :attendees
  has_one_attached :logo

  # Validations
  validates :title, :logo, :date, :time_start, :time_end, presence: true
  validate :acceptable_image

  # Scopes

  # Callbacks

  # Class Methods

  private

  def acceptable_image
    return unless logo.attached?

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(logo.content_type)
      errors.add(:logo, "must be a JPEG or PNG")
    end
  end

  # Instance Methods

end
