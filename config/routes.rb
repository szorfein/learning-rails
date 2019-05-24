Rails.application.routes.draw do
  namespace :admin do
    get 'application/index'
  end

  devise_for :users
  resources :posts
  resources :faqs
  resources :categories
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources "greeting" do 
    collection do
      get "say_goodmorning"
      get "say_goodafternoon"
    end
  end
  resources :random_image
  resources :contact

  root "projects#index"
  # create route /project/:project_id/tickets/:id
  resources :projects do
    resources :tickets
  end

  namespace :admin do
    root 'application#index'
  end
end
