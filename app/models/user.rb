# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord


  has_many :tournaments
  has_many :teams
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 },
                       confirmation: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :first_name, presence: true, allow_blank: false, format: /\A([a-zA-Z']*)\z/
  validates :last_name, presence: true, allow_blank: false, format: /\A([a-zA-Z' ]*)\z/

  def full_name
    "#{first_name} #{last_name}"
  end

  def generate_token_and_save
    loop do
      self.token = SecureRandom.hex(64)
      break if save
    end
  end
end
