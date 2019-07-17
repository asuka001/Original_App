require 'test_helper'

class WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get words_path
    assert_response :success
  end


  test "should get new" do
    get new_word_path
    assert_response :success
  end

  test "should get edit" do
    get edit_word_path
    assert_response :success
  end

  test "should get show" do
    get word_path
    assert_response :success
  end


end
