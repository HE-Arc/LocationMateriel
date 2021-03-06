Rails.application.routes.draw do
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  #get 'products/show'

  #get 'products/edit'

  #get 'products/update'

  #get 'products/new'

  #get 'products/create'

  #get 'products/destroy'

  get '/tenants/:id/confirm' => 'tenants#confirm', as: :tenants_confirm
  get '/tenants/:id/refuse' => 'tenants#refuse', as: :tenants_refuse

  resources :tenants
  
  resources :products

  root 'home#home'

  #get '/products/index' => 'products#index', as: :product
  #get '/products/search' => 'products#search', as: :products_search

  #get '/products/new' => 'products#new', as: :products_new
  #get '/products/:id' => 'products#show', as: :product
  get '/products/:id/new_question' => 'questions#new', as: :new_question
  get '/tenants/new/:id' => 'tenants#new', as: :location_article
  
  post '/questions' => 'questions#create', as: :create_question

  #post '/tenants/new/:id' => 'tenants#create', as: :create_tenant

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
