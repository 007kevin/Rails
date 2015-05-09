Rails.application.routes.draw do
  root 'static_pages#home'
  # before: get 'static_pages/help'
  get 'help' => 'static_pages#help'
  # before: get 'static_pages/about'
  get 'about' => 'static_pages#about'
  # before: get 'static_pages/contact'
  get 'contact' => 'static_pages#contact'
#  get 'signup' => 'users#new'
  get 'signup', to: 'users#new'
end
