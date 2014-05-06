Bstore::Application.routes.draw do

  namespace :admin do
    resources :products

    get  '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
  end

  resources :subscriptions

  get  '/customers' => 'customers#new', as: 'customer_signup'
  post '/customers' => 'customers#create'

  get '/products' => 'products#index', as: 'products'
  get '/products/:id'  => 'products#show', as: 'product'

  get '/verify/:token' => 'customers#verify', as: 'verify_customer'

  get  '/login' => 'logins#new', as: 'logins'
  post '/login' => 'logins#create'
  delete '/login' => 'logins#destroy'

  post '/products/:product_id/add_to_cart' => 'carts#create',
    as: 'add_product_to_cart'

  resource :cart
  resources :orders

  root :to => 'products#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #    Http method 'path' => 'controller action'
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
