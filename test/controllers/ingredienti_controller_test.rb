require "test_helper"

class IngredientiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ingredienti_index_url
    assert_response :success
  end

  test "should get show" do
    get ingredienti_show_url
    assert_response :success
  end

  test "should get new" do
    get ingredienti_new_url
    assert_response :success
  end

  test "should get create" do
    get ingredienti_create_url
    assert_response :success
  end

  test "should get edit" do
    get ingredienti_edit_url
    assert_response :success
  end

  test "should get update" do
    get ingredienti_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ingredienti_destroy_url
    assert_response :success
  end
end
