class Tournament < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_and_belongs_to_many :teams
  belongs_to :user
  has_attached_file :pdf
  validates_attachment :pdf, content_type: { content_type: "application/pdf" }

  def generar_partidos
    self.partidos_generados = true
    partidos = []
    equipos = self.teams
    equipos.length.times  do |first|
      (first + 1).upto(equipos.length - 1)  do |second|
        self.matches.create(fecha: Time.now, equipo_local: equipos[first],
        equipo_visita: equipos[second], status_match: 'fijado')
      end
    end
  end
end
