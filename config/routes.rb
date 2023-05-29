Rails.application.routes.draw do
  resources :tickets # This adds all the paths at once: edit, new, destroy, show.
  root 'tickets#index'
  devise_for :users, controllers: {
    passwords: 'passwords',
    registrations: 'registrations',
    sessions: 'sessions'
}

  resource :two_factor_settings, except: [:index, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
