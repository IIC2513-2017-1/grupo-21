# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  nombre     :string
#  tipo       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TournamentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
