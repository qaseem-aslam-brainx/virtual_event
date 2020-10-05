class Sponsor < ApplicationRecord
  belongs_to :event
  validates :logo, :name, :website, :status, presence: true
  enum status: [ :active, :deactive ]
  validates :website, format:
             { with: /(((http|https):\/\/|)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?)\z/i }
end
