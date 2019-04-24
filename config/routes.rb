Rails.application.routes.draw do
  get 'recipe_ingredients/index'
  get 'recipe_ingredients/show'
  get 'ingredients/index'
  get 'ingredients/show'
  get 'recipes/index'
  get 'recipes/show'
  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index, :show]
      resources :ingredients, only: [:index, :show]
      resources :recipe_ingredients, only: [:index, :show]
     end
   end


end
