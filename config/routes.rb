TaskManager::Application.routes.draw do

  root to: "dashboard#index"

  resource :session
  resources :users
  resources :stories do
    put :change_state
    resources :comments
  end
  
end
