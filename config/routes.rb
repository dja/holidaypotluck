HolidayPotluck::Application.routes.draw do
  

  root to: 'home#index'

  get 'profile' => 'profile#index'

  get 'items' => 'items#index', as: 'items'
  post 'items' => 'items#create'
  post 'item/delete' => 'items#destroy'

  
end
