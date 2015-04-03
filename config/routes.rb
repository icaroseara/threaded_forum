Rails.application.routes.draw do
  root 'posts#index'
  
  resources :posts, only: [:index, :show, :create]
  
  resources :comments, only: [:index, :create]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
  get '/reply/new/(:post_id)', to: 'comments#new', as: :first_comment
end
