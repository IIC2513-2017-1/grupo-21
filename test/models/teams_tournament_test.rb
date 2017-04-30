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

require 'test_helper'

class TeamsTournamentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
