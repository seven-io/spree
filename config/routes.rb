Spree::Core::Engine.add_routes do
  namespace :admin do
    get '/seven/sms', to: 'sms#index', as: :seven_sms
    post '/seven/sms', to: 'sms#submit'

    resource :seven_settings, only: [:edit, :update]
  end
end