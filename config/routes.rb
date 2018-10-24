Rails.application.routes.draw do
  root to: 'welcome#index'
  post "/login", to: "sessions#create"
end
