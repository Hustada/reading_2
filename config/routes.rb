Rails.application.routes.draw do
  root 'lists#index'

  resources :lists do
    resources :books do
    member do
      put :finish
      put :unfinish
    end
    end
  end
end
