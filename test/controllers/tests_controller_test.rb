require "test_helper"

class TestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @test = tests(:one)
    @question = @test.questions.first
    @answer = @question.answers.first
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get tests_url
    assert_response :success
  end

  test "should get new" do
    get new_test_url
    assert_response :success
  end

  test "should create test" do
    assert_difference('Test.count') do
      post tests_url,  params: { test: { description: @test.description, name: @test.name,
                                        questions_attributes: [{ title: @question.title, description: @question.description,
                                          answers_attributes: [{ result: @answer.result, correct: @answer.correct }]
                                        }]
                                      }
                                    }
    end

    assert_redirected_to test_url(Test.last)
  end

  test "should show test" do
    get test_url(@test)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_url(@test)
    assert_response :success
  end

  test "should update test" do
    patch test_url(@test), params: { test: { description: @test.description, name: @test.name,
                                        questions_attributes: [{ title: @question.title, description: @question.description,
                                          answers_attributes: [{ result: @answer.result, correct: @answer.correct }]
                                        }]
                                      }
                                    }
    assert_redirected_to test_url(@test)
  end

  test "should destroy test" do
    assert_difference('Test.count', -1) do
      delete test_url(@test)
    end

    assert_redirected_to tests_url
  end
end
