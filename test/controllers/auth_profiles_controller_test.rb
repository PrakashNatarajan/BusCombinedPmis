require "test_helper"

class AuthProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_profile = auth_profiles(:one)
  end

  test "should get index" do
    get auth_profiles_url, as: :json
    assert_response :success
  end

  test "should create auth_profile" do
    assert_difference("BusAuthProfile.count") do
      post auth_profiles_url, params: { auth_profile: { access_token: @auth_profile.access_token, created_at: @auth_profile.created_at, expired_at: @auth_profile.expired_at, group_channel: @auth_profile.group_channel, role_level: @auth_profile.role_level, role_prod: @auth_profile.role_prod, role_user: @auth_profile.role_user, updated_at: @auth_profile.updated_at } }, as: :json
    end

    assert_response :created
  end

  test "should show auth_profile" do
    get auth_profile_url(@auth_profile), as: :json
    assert_response :success
  end

  test "should update auth_profile" do
    patch auth_profile_url(@auth_profile), params: { auth_profile: { access_token: @auth_profile.access_token, created_at: @auth_profile.created_at, expired_at: @auth_profile.expired_at, group_channel: @auth_profile.group_channel, role_level: @auth_profile.role_level, role_prod: @auth_profile.role_prod, role_user: @auth_profile.role_user, updated_at: @auth_profile.updated_at } }, as: :json
    assert_response :success
  end

  test "should destroy auth_profile" do
    assert_difference("BusAuthProfile.count", -1) do
      delete auth_profile_url(@auth_profile), as: :json
    end

    assert_response :no_content
  end
end
