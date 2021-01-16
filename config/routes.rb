Rails.application.routes.draw do
  resources :courses
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  delete '/article/:id', to: 'article#destroy'
end
