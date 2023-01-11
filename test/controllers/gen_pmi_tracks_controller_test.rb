require "test_helper"

class GenPmiTracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pmi_tracking = pmi_trackings(:one)
  end

  test "should get index" do
    get pmi_trackings_url, as: :json
    assert_response :success
  end

  test "should create pmi_tracking" do
    assert_difference("PmiTracking.count") do
      post pmi_trackings_url, params: { pmi_tracking: { created_at: @pmi_tracking.created_at, guid: @pmi_tracking.guid, pmi_short_name: @pmi_tracking.pmi_short_name, owner_prod: @pmi_tracking.owner_prod, owner_role: @pmi_tracking.owner_role, owner_user: @pmi_tracking.owner_user, role_level: @pmi_tracking.role_level, role_prod: @pmi_tracking.role_prod, role_user: @pmi_tracking.role_user, source_type: @pmi_tracking.source_type, start_date: @pmi_tracking.start_date, start_value: @pmi_tracking.start_value, target_date: @pmi_tracking.target_date, target_value: @pmi_tracking.target_value, track_status: @pmi_tracking.track_status, updated_at: @pmi_tracking.updated_at } }, as: :json
    end

    assert_response :created
  end

  test "should show pmi_tracking" do
    get pmi_tracking_url(@pmi_tracking), as: :json
    assert_response :success
  end

  test "should update pmi_tracking" do
    patch pmi_tracking_url(@pmi_tracking), params: { pmi_tracking: { created_at: @pmi_tracking.created_at, guid: @pmi_tracking.guid, pmi_short_name: @pmi_tracking.pmi_short_name, owner_prod: @pmi_tracking.owner_prod, owner_role: @pmi_tracking.owner_role, owner_user: @pmi_tracking.owner_user, role_level: @pmi_tracking.role_level, role_prod: @pmi_tracking.role_prod, role_user: @pmi_tracking.role_user, source_type: @pmi_tracking.source_type, start_date: @pmi_tracking.start_date, start_value: @pmi_tracking.start_value, target_date: @pmi_tracking.target_date, target_value: @pmi_tracking.target_value, track_status: @pmi_tracking.track_status, updated_at: @pmi_tracking.updated_at } }, as: :json
    assert_response :success
  end

  test "should destroy pmi_tracking" do
    assert_difference("PmiTracking.count", -1) do
      delete pmi_tracking_url(@pmi_tracking), as: :json
    end

    assert_response :no_content
  end
end
