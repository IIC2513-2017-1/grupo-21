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

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
