class Team < ApplicationRecord
  has_many :players
  has_and_belongs_to_many :tournaments
  has_many :matches, :class_name => 'Match', :foreign_key => 'equipo_local_id'
  has_many :matches, :class_name => 'Match', :foreign_key => 'equipo_visita_id'

  validates :nombre, presence: true, allow_blank: false, uniqueness: true, format: /\A[a-zA-Z ]*\z/
  validates :pais, presence: true, allow_blank: false
end
