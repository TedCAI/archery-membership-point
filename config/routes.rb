Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(index show update) do
    member do
      get :new_record
      post :create_new_record
    end

    collection do
      get :logout
    end
  end

  root to: "users#index"
end
