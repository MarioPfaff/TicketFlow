Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    passwords: 'passwords',
    registrations: 'registrations',
    sessions: 'sessions'
}

  resource :two_factor_settings, except: [:index, :show] do
    
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/two_factor_settings/download', to: 'two_factor_settings#generateFile'
  # Defines the root path route ("/")
  # root "articles#index"
end
