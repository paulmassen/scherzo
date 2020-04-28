require 'test_helper'

class EngagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @engagement = engagements(:one)
  end

  test "should get index" do
    get engagements_url
    assert_response :success
  end

  test "should get new" do
    get new_engagement_url
    assert_response :success
  end

  test "should create engagement" do
    assert_difference('Engagement.count') do
      post engagements_url, params: { engagement: { artiste: @engagement.artiste, begin: @engagement.begin, contract: @engagement.contract, end: @engagement.end, hotel: @engagement.hotel, rehearsals: @engagement.rehearsals, sent: @engagement.sent, taxi: @engagement.taxi, title: @engagement.title } }
    end

    assert_redirected_to engagement_url(Engagement.last)
  end

  test "should show engagement" do
    get engagement_url(@engagement)
    assert_response :success
  end

  test "should get edit" do
    get edit_engagement_url(@engagement)
    assert_response :success
  end

  test "should update engagement" do
    patch engagement_url(@engagement), params: { engagement: { artiste: @engagement.artiste, begin: @engagement.begin, contract: @engagement.contract, end: @engagement.end, hotel: @engagement.hotel, rehearsals: @engagement.rehearsals, sent: @engagement.sent, taxi: @engagement.taxi, title: @engagement.title } }
    assert_redirected_to engagement_url(@engagement)
  end

  test "should destroy engagement" do
    assert_difference('Engagement.count', -1) do
      delete engagement_url(@engagement)
    end

    assert_redirected_to engagements_url
  end
end
