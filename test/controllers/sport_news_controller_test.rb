require 'test_helper'

class SportNewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sport_news_index_url
    assert_response :success
  end

end
