class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_and_belongs_to_many :tournaments
  belongs_to :user
  has_many :matches, :class_name => 'Match', :foreign_key => 'equipo_local_id'
  has_many :matches, :class_name => 'Match', :foreign_key => 'equipo_visita_id'

  validates :nombre, presence: true, allow_blank: false, uniqueness: true, format: /\A[a-zA-Z ]*\z/
  validates :pais, presence: true, allow_blank: false

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
