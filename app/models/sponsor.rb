class Sponsor < ApplicationRecord
  # Constants

  # Attributes

  # Extensions
  enum status: [:active, :deactive]

  # Relationships
  belongs_to :event
  has_one_attached :logo


  # Validations
  validates :name, :logo, :website, :status, presence: true
  validates :website, format:
    { with: /(((http|https):\/\/|)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?)\z/i },
            unless: Proc.new { |a| a.website.blank? }
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
