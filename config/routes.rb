Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :items do
   resources :orders, only: [:index, :new, :create]
  end
end
