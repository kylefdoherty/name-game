Rails.application.routes.draw do
  resources :teammates
  resources :games, only: [:new, :create, :index] do
    resources :question_groups, only: [:show, :update] do
      resources :questions, shallow: true
    end
  end

  root 'games#index'


end
