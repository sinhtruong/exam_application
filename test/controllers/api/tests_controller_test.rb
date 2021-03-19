require "test_helper"

class Api::TestsControllerTest < ActionDispatch::IntegrationTest
  include AuthorizationHelper
  setup do
    @test = tests(:one)
    @user = users(:one)
    test_user = { email: @user.email, password: '12345678' }
    @auth_tokens = auth_tokens_for_user(test_user)
  end

  test "should get index" do
    get api_tests_url, headers: @auth_tokens, as: :json
    assert_response :success
  end

  test "should show test" do
    get api_test_url(@test), headers: @auth_tokens, as: :json
    assert_response :success
  end

  test "should get test result" do
    test_result = [
                {question_id: 1, answers: [1]},
                {question_id: 2, answers: [2,3]}
             ]
    post result_api_test_url(@test), params: test_result, headers: @auth_tokens, as: :json
    assert_response :success
  end

end
