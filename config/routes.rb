Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cocktails#index'
  resources :cocktails do
    get 'search'=> 'cocktails#search'
    resources :doses, only: [:new, :create, :edit, :update, :destroy]
  end
end
