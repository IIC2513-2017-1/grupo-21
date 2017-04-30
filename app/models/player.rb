# == Schema Information
#
# Table name: players
#
#  id           :integer          not null, primary key
#  nombre       :string
#  apellido     :string
#  nacionalidad :string
#  edad         :integer
#  dorsal       :integer
#  goles        :integer
#  asistencias  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  team_id      :integer
#
class Player < ApplicationRecord
  belongs_to :team

  validates :nombre, presence: true, allow_blank: false, format: /\A([A-Za-z']*)\z/
  validates :apellido, presence: true, allow_blank: false, format: /\A([A-Za-z']*)\z/
  # el formato es para validar que solo tenga caracteres, no numeros, espacios ni caracteres especiales, salvo el apostrofe
  validates :pais, presence: true, allow_blank: false
  validates :team_id, presence: true, allow_blank: false
  validates :edad, presence: true, allow_blank: false
  validates_inclusion_of :edad, :in => 5..65
  # esto valida que los jugadores tengan entre 5 y 65 años. Decidí que 5 es una edad mínima correcta para participar.
end
