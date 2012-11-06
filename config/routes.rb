TaskManager::Application.routes.draw do

  root to: "dashboard#index"

  resource :session
  resources :users
  resources :stories do
    get "/:event" => "stories#change_state", as: :set_state
    resources :comments
  end
  
end
