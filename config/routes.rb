Rails.application.routes.draw do
  get 'mypages/show'
  devise_for :users
  root "tweets#index"
  get "mypage", to: "mypages#show"
  resources :tweets
end
