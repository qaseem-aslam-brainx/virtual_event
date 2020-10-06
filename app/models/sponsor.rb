class Sponsor < ApplicationRecord
  belongs_to :event
  validates :name, :logo, :website, :status, presence: true
  enum status: [ :active, :deactive ]
  validates :website, format:
             { with: /(((http|https):\/\/|)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?)\z/i },
               unless: Proc.new { |a| a.website.blank? }
end
