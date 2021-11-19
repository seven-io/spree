Spree::Core::Engine.add_routes do
  namespace :admin do
    get '/seven/sms', to: 'sms#index'
    post '/seven/sms', to: 'sms#submit'
  end
end
