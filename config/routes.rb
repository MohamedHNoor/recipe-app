Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"
  
  resources :users, only: [:index, :show]  do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only:[:index, :show, :new, :create, :destroy] do
      resources :recipe_foods, only: [:index, :show, :new, :create, :destroy]
    end
  end

  get '/shopping_list', to: 'shopping_list#index', as: 'shopping_list'
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'

end
