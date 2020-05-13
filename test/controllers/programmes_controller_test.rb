require 'test_helper'

class ProgrammesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @programme = programmes(:one)
  end

  test "should get index" do
    get programmes_url
    assert_response :success
  end

  test "should get new" do
    get new_programme_url
    assert_response :success
  end

  test "should create programme" do
    assert_difference('Programme.count') do
      post programmes_url, params: { programme: { title: @programme.title } }
    end

  end

  test "should show programme" do
    get programme_url(@programme)
    assert_response :success
  end

  test "should get edit" do
    get edit_programme_url(@programme)
    assert_response :success
  end

  test "should update programme" do
    patch programme_url(@programme), params: { programme: { title: @programme.title } }
  end

  test "should destroy programme" do
    assert_difference('Programme.count', -1) do
      delete programme_url(@programme)
    end

  end
end
