Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :home, only: :show
  resource :profile, only: [:show, :destroy]
  resource :tracks, only: [:create] do
    put :search
  end

  get "/auth/spotify/callback", to: "session#create"
  delete "/logout", to: "session#destroy"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  root "landing#index"
end
