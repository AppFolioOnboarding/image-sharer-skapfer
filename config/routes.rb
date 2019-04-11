Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'imageurls/:imageurl_id/share', to: 'imageurl_shares#new'
  post 'imageurls/:imageurl_id/share', to: 'imageurl_shares#create'
  resources :imageurls, only: %i[new create show index]
  root 'imageurls#index'
end
