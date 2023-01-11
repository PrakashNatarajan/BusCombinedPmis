require "test_helper"

class PmiOneHierLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pmi_one_hier_level = pmi_one_hier_levels(:one)
  end

  test "should get index" do
    get pmi_one_hier_levels_url, as: :json
    assert_response :success
  end

  test "should create pmi_one_hier_level" do
    assert_difference("PmiOneHierLevel.count") do
      post pmi_one_hier_levels_url, params: { pmi_one_hier_level: { achiev: @pmi_one_hier_level.achiev, last_updated: @pmi_one_hier_level.last_updated, target: @pmi_one_hier_level.target } }, as: :json
    end

    assert_response :created
  end

  test "should show pmi_one_hier_level" do
    get pmi_one_hier_level_url(@pmi_one_hier_level), as: :json
    assert_response :success
  end

  test "should update pmi_one_hier_level" do
    patch pmi_one_hier_level_url(@pmi_one_hier_level), params: { pmi_one_hier_level: { achiev: @pmi_one_hier_level.achiev, last_updated: @pmi_one_hier_level.last_updated, target: @pmi_one_hier_level.target } }, as: :json
    assert_response :success
  end

  test "should destroy pmi_one_hier_level" do
    assert_difference("PmiOneHierLevel.count", -1) do
      delete pmi_one_hier_level_url(@pmi_one_hier_level), as: :json
    end

    assert_response :no_content
  end
end
