Rails.application.routes.draw do
  get "settings/admin"
  post "settings/admin" => "settings#examiner", as: :settings_examiner
  post "settings/admin" => "settings#age_sections", as: :age_sections_settings
  post "settings/admin" => "settings#marks", as: :marks_settings
  post "examiners/create" => "examiners#create", as: :examiner
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
  resources :groups, only: [ :index, :show, :new, :create, :edit, :update ]
  post "groups/search" => "groups#search", as: :search_groups
  resources :eval_sessions, except: [ :index, :edit ]
  resources :evals, only: [ :create ]
  resources :criterium, only: [ :new, :create ]
  patch "eval_sessions/valid_session" => "eval_sessions#valid_session", as: :valid_session
  resources :age_sections, except: [ :new, :create, :destroy ]
  resources :age_examiners, only: [ :create, :destroy ]
  resources :statuses, only: [ :update ]
end
