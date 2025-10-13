Rails.application.routes.draw do
  devise_for :examiners
  root to: "home#show"
  get "up" => "rails/health#show", as: :rails_health_check
end
