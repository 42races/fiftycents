Rails.application.routes.draw do
  resources :posts

  devise_for :users
  root 'posts#index'

  resource :profile, only: [:new, :show, :edit, :update]

  get '/:username', to: 'profiles#public_profile'
end
