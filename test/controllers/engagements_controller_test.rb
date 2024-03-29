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
      post engagements_url, params: { engagement: { artiste: @engagement.artiste.name, startengagement: @engagement.startengagement, contract: @engagement.contract, endengagement: @engagement.endengagement, hotel: @engagement.hotel, rehearsals: @engagement.rehearsals, sent: @engagement.sent, taxi: @engagement.taxi, title: @engagement.title } }
    end
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
    patch engagement_url(@engagement), params: { engagement: { artiste: @engagement.artiste, startengagement: @engagement.startengagement, contract: @engagement.contract, endengagement: @engagement.endengagement, hotel: @engagement.hotel, rehearsals: @engagement.rehearsals, sent: @engagement.sent, taxi: @engagement.taxi, title: @engagement.title } }
  end

  test "should destroy engagement" do
    assert_difference('Engagement.count', -1) do
      delete engagement_url(@engagement)
    end

  end
end
