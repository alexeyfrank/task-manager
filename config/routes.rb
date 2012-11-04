TaskManager::Application.routes.draw do

  root to: "stories#index"

  resource :session
  resources :users
  resources :stories do
    get "/:event" => "stories#change_state", as: :set_state
  end
  
end
