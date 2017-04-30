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

require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
