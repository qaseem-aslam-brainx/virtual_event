class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, length: { in: 8..20,
                                                 too_long: 'is too long.Maximum is 20',
                                                 too_short: 'is too short. Minimum is 8' },
            unless: Proc.new { |a| a.password.blank? }
end
