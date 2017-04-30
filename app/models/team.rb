class Team < ApplicationRecord
  has_many :players
  has_and_belongs_to_many :tournaments

  def nombre_completo

  end
end
