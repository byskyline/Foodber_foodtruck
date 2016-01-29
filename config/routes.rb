Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :food_trucks do
    member do
      get :driver
      post :location_upload
      post :get_order
    end
    resources :foods, :controller => 'food_trucks_foods'
  end

  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do

    post "login" => "auth#login" # POST /api/v1/login
    post "logout" => "auth#logout"

    resources :food_trucks # ApiV1::FoodTrucksController
    resources :foods
  end

  resources :order

  #match "landingpage" => redirect("landingpage/index/")
  # get "welcome/say_hello" =>"welcome#say"
  # get "welcome" =>"welcome#index"
  #get "welcome/say_hello" =>"welcome#say"
  #get "welcome" =>"welcome#index"

  #namespace :admin do
  #  resources :food_trucks do
  #    resources :foods, :controller => 'food_trucks_foods'
  #  end
  #  root :to => "food_trucks#index"
  #end

  resources :food_trucks do
    resources :foods, :controller => 'food_trucks_foods'
  end

  #get "driver" => "food_trucks#driver"
  post "location_upload" => "food_trucks#location_upload"

  root :to => "food_trucks#index"
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
