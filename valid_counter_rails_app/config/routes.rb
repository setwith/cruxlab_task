Rails.application.routes.draw do
  root 'passwords#new'
  post '/', to: 'passwords#create'
  get 'uploaded/:count', to: 'passwords#uploaded', as: 'uploaded'
end
