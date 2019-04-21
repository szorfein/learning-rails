Rails.application.routes.draw do
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
end
