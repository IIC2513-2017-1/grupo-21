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
  # validate :nombre_metodo, ejecutará el método con ese nombre, el cual,
  # estará definido en el modelo. Las cosas de lógica por lo general deberían estar
  # en el modelo.
  # def nombre_metodo
  #   self.atributo: es un atributo que fue creado con los params entregados por el form
  # end
end
