class Tournament < ApplicationRecord
  has_many :matches
  has_and_belongs_to_many :teams
end
