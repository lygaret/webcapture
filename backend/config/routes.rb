Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    scope :v1 do
      resource :user, only: [:show, :update] do
        post :authenticate
      end

      resources :templates, except: [:new, :edit]
      resources :captures, except: [:new, :edit] do
        post :twilio_hook, on: :collection
      end
    end
  end
end