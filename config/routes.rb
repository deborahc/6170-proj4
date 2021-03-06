NlujanDeborahcYtungDbgeorgeFinal::Application.routes.draw do
  resources :users
  resources :reviews
  resources :postings
  resources :urop_applications do
    resources :emails
  end

  resources :students, :controller => 'users', :type => 'Student'
  resources :supervisors, :controller => 'users', :type => 'Supervisor'
  resources :sessions, only: [:new, :create, :destroy]

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  get "/student_applications" => "urop_applications#student_application_index", :as => "student_application_index"
  get "/supervisor_applications" => "urop_applications#supervisor_application_index", :as => "supervisor_application_index"
  get "/supervisor_applications/:posting_id" => "postings#show_application", :as => "supervisor_application_show"

  get "/:application/email" => "urop_applications#email", :as => "email" 

  #unless Rails.application.config.consider_all_requests_local
    get '/404' =>'errors#not_found'
    get '/500' =>'errors#not_found'
  #end


  root :to => "welcome#landing"


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
