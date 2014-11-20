Rails.application.routes.draw do
  resources :teammates
  resources :games, only: [:new, :create, :index] do
    resources :question_group, only: [:show]
  end

  root 'games#index'


end
