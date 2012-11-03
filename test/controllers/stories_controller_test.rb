require "minitest_helper"

class StoriesControllerTest < MiniTest::Rails::ActionController::TestCase

  before do
    @story = stories(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:stories)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Story.count') do
      post :create, story: {  }
    end

    assert_redirected_to story_path(assigns(:story))
  end

  def test_show
    get :show, id: @story
    assert_response :success
  end

  def test_edit
    get :edit, id: @story
    assert_response :success
  end

  def test_update
    put :update, id: @story, story: {  }
    assert_redirected_to story_path(assigns(:story))
  end

  def test_destroy
    assert_difference('Story.count', -1) do
      delete :destroy, id: @story
    end

    assert_redirected_to stories_path
  end
end
