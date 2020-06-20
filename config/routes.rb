Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions',
                                      passwords: 'users/passwords'}
  root  'videos#index'
  resources :videos do
    get :search, on: :collection
  end
  
  get "users/:id", :to => "users#show", as: "user"
  
  devise_scope :user do
    get "/users/sign_out", :to => "users/sessions#destroy"
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    get "password/new", :to => "users/passwords#new"
    delete "/sign_out", :to => "users/sessions#destroy"
  end
end
