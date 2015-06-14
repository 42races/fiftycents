Rails.application.routes.draw do
  devise_for :users
  resources :posts

  resources :votes, only: [] do
    member do
      post :upvote
      post :downvote
    end
  end

  resources :bookmarks, only: [:index, :create] do
    collection do
      delete :destroy
    end
  end

  resource :search,  only: [:create] do
    collection do
      get :tags, path: '/tags/:tag'
    end
  end

  resource :profile, only: [:new, :show, :edit, :update]

  root 'posts#index'

  get '/:username', to: 'profiles#public_profile'
end
