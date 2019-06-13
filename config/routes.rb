Rails.application.routes.draw do

  namespace :admin do
    root 'application#index'

    resources :projects, only: [:new, :create, :destroy]
    resources :users do
      member do
        patch :archive
      end
    end
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
  resources :projects, only: [:index, :show, :edit, :update] do
    resources :tickets
  end

end
