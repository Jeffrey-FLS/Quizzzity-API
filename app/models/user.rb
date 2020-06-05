
class User < ApplicationRecord

  # has_secure_password

  # Constant Variable
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i.freeze

  # Securing Validations
  validates :first_name, :last_name, presence: true, length: { maximum: 35 }
  validates :username, presence: true, length: { within: 8..25 },
            uniqueness: true
  validates :email, presence: true, length: { maximum: 100 }, format: EMAIL_REGEX,
                   uniqueness: true

  # Sorting Users
  scope :sorted, -> { order('last_name ASC, first_name ASC') }

  def name
    "#{first_name} #{last_name}"
  end
end
