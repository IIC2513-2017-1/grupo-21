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
  validates :password, presence: true, length: { minimum: 6 },
                       confirmation: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :first_name, presence: true, allow_blank: false, format: /\A([a-zA-Z']\S*)\z/
  validates :last_name, presence: true, allow_blank: false, format: /\A([a-zA-Z']\S*)\z/
end
