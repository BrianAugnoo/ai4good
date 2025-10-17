Rails.application.routes.draw do
  get "menu/admin"
  get "menu/examiner"
  devise_for :admins
  devise_for :examiners
  root to: "home#show"
  get "display" => "home#projection", as: :home_projection
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard/admin" => "dashboard#admin", as: :admin_dashboard
  get "dashboard/examiner" => "dashboard#examiner", as: :examiner_dashboard
end
