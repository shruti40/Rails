Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'users#index'
  post '/sessions' => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  post '/users' => 'users#create'
  post '/teams/create' => 'teams#create'
  post '/teams/update' => 'teams#update'
  get 'teams/:id/get_team_members/' => 'teams#get_team_members', as: :get_team_members


 

  resources :teams do
    member do
    end
    collection do
    
    end
  end

  resources :shifts do
    member do
    end
    collection do
    
    end
  end

end
