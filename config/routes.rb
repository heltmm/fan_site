Rails.application.routes.draw do
  devise_for :users
  root :to => 'posts#index'

  resources :posts do
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end
end
