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
  has_many :event_times
  accepts_nested_attributes_for :event_times, allow_destroy: true, reject_if:
      lambda { |attributes| attributes['date'].blank? || attributes['time_start'].blank? || attributes['time_end'].blank? }

  # Validations
  validates :title, :logo, presence: true
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
