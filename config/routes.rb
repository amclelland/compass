Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :accomplishments
  resources :meetings
  resources :goals do
    resources :checkins, controller: 'goals/checkins'
  end
end
