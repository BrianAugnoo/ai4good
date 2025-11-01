Rails.application.routes.draw do
  get "session/new"
  get "session/show"
  get "menu/admin"
  get "menu/examiner"
  devise_for :admins
  devise_for :examiners
  root to: "home#show"
  get "display" => "home#projection", as: :home_projection
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard/admin" => "dashboard#admin", as: :admin_dashboard
  get "dashboard/examiner" => "dashboard#examiner", as: :examiner_dashboard
  resources :groups, only: [ :index, :show, :new, :create, :update ]
  post "groups/search" => "groups#search", as: :search_groups
  resources :eval_sessions, except: [ :index, :edit ]
  resources :evals, only: [ :create ]
  resources :criterium, only: [ :create ]
  patch "eval_sessions/valid_session" => "eval_sessions#valid_session", as: :valid_session
  resources :age_sections, except: [ :new, :create, :destroy ]
end
