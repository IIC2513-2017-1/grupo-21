# == Schema Information
#
# Table name: teams_tournaments
#
#  id            :integer          not null, primary key
#  tournament_id :integer
#  team_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TeamsTournament < ApplicationRecord
  belongs_to :tournament
  belongs_to :team
end
