Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  resources :skills , :employees , :leads



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
