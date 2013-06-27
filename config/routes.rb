Sms::Application.routes.draw do
  root to: "home#index"
  resources :school_classes
  resources :students
end
