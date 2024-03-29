# == Schema Information
#
# Table name: matches
#
#  id             :integer          not null, primary key
#  fecha          :datetime
#  goles_local    :integer
#  goles_visita   :integer
#  penales        :boolean
#  penales_local  :integer
#  penales_visita :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tournament_id  :integer
#

class Match < ApplicationRecord
  belongs_to :tournament

  belongs_to :equipo_local, :class_name => 'Team'
  belongs_to :equipo_visita, :class_name => 'Team'

  validates :fecha, presence: true, allow_blank: false
  validates :equipo_local, presence: true, allow_blank: false
  validates :equipo_visita, presence: true, allow_blank: false
  validate :differents_teams?
  validate :valid_goals?
  # validate :nombre_metodo, ejecutará el método con ese nombre, el cual,
  # estará definido en el modelo. Las cosas de lógica por lo general deberían estar
  # en el modelo.
  # def nombre_metodo
  #   self.atributo: es un atributo que fue creado con los params entregados por el form
  # end
  def resultado
    "#{goles_local} - #{goles_visita}"
  end



  private

  def differents_teams?
    msg = "no puede ser el mismo que el equipo visita"
    errors.add(:equipo_local, msg) unless equipo_local != equipo_visita
  end

  def valid_goals?
    msg = "no puede ser negativo"
    if goles_local && goles_local < 0
      errors.add(:goles_local, msg)
    elsif goles_visita && goles_visita < 0
      errors.add(:goles_visita, msg)
    end
  end


end
