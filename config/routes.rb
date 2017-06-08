Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"


  devise_for :users
  root to: 'pages#home'

  resources :tracks do
    member do
      get 'week_show'
    end
  end


  resources :categories
  get 'week' => 'tracks#week'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
