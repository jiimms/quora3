Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :responses
    member do
      put "like", to:    "questions#upvote"
      put "dislike", to: "questions#downvote"
    end
  end
  
   root 'questions#index'
end
