Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "foods#index"

  # get 'recipe_foods/:recipe_id', to: 'recipe_foods#new', as: 'new_recipe_food'
  # post 'recipe_foods/:recipe_id', to: 'recipe_foods#create', as: 'create_recipe_food'
  
  resources :users, only: [:index, :show]  do
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
  end

  # post '/users/:user_id/recipes/:recipe_id/recipe_foods', to: 'recipe_foods#create', as: 'create_recipe_recipe_food'
  get 'shopping_list/:recipe_id', to: 'recipes#shopping_list', as: 'shopping_list'
  get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'

  # Defines the root path route ("/")
end
