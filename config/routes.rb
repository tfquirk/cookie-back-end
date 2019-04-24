Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index, :show]
      resources :ingredients, only: [:index, :show]
      resources :recipe_ingredients, only: [:index, :show]
     end
   end


end
