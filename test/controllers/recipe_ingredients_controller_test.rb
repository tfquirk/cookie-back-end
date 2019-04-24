require 'test_helper'

class RecipeIngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recipe_ingredients_index_url
    assert_response :success
  end

  test "should get show" do
    get recipe_ingredients_show_url
    assert_response :success
  end

end
