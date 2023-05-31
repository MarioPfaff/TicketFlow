Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    passwords: 'passwords',
    registrations: 'registrations',
    sessions: 'sessions'
}

  resource :two_factor_settings, except: [:index, :show] do
    member do
      post :download, to: 'two_factor_settings#generateFile'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
