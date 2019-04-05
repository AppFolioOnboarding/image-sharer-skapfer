Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/imageurls', status: 307)
  resources :imageurls, only: %i[new create show index]
end
