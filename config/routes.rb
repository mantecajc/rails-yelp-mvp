Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show, :new, :create] do
    collection do
      get :chinese
      get :italian
      get :japanese
      get :french
      get :belgian
    end
    resources :reviews, only: [:new, :create]
  end
end
