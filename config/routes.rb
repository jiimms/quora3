Rails.application.routes.draw do
  get 'pages/project'
  post 'questions/search_query'
  resources :favorite_questions, only: [:create, :destroy]
  devise_for :users
  resources :questions do
    member do
      put "like", to:    "questions#upvote"
      put "dislike", to: "questions#downvote"
    end
    resources :responses 
  end
  resources :responses do
    	member do
      put "like", to:    "responses#upvote"
      put "dislike", to: "responses#downvote"
    end
    end
   root 'questions#index'
end
