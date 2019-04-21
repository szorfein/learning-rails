Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources "greeting" do 
    collection do
      get "say_goodmorning"
      get "say_goodafternoon"
    end
  end
end
