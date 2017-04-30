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

  belongs_to :equipo_local, :class_name => 'User'
  belongs_to :equipo_visita, :class_name => 'User'
end
