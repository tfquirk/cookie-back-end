class Api::V1::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render json: @recipes, status: :ok
  end

  def show
    @recipe = Recipe.find(params[:id])
    render json: @recipe, status: :ok
  end
end
