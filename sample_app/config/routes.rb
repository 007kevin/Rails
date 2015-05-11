Rails.application.routes.draw do

=begin Before Chapter 8
  get 'sessions/new'

  root 'static_pages#home'
  # before: get 'static_pages/help'
  get 'help' => 'static_pages#help'
  # before: get 'static_pages/about'
  get 'about' => 'static_pages#about'
  # before: get 'static_pages/contact'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  resources :users
=end

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users

end
