require "test_helper"

class SongSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get song_search_index_url
    assert_response :success
  end
end
