class Api::V1::RecipeIngredientsController < ApplicationController
  def index
    @recipe_ingredients = RecipeIngredient.all
    render json: @recipe_ingredients, status: :ok
  end

  def show
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    render json: @recipe_ingredient, status: :ok
  end
end
