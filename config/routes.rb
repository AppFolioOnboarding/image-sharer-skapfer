Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :imageurls, only: %i[new create show index]
  root 'imageurls#index'
end
