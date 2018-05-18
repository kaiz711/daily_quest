Rails.application.routes.draw do
  
  get 'photocomplete/success'

  get 'photocomplete/fail'

  get 'admin/index'

  resources :posts
  
  
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks'}
  
  root 'home#index'
  
  get 'home/index2'

  get '/admin' => 'admin#admin'
  
  get '/admin/index' => 'admin#index'
  
  get '/test' => 'home#test'
  
  get '/makeQuest' => 'home#makeQuest_new'
  
  get '/home/makeQuest_new/:quest_id/:user_id' => 'home#selectQuest'
  
  get '/home/index'
  
  get '/home/login_design'
  
  get '/home/signup'
  
  get '/home/makeQuest_quest' => 'home#completeQuest'
  
  get '/home/makeQuest_success'
  
  get '/home/makeQuest_quest/:quest_id/:user_id' => 'home#completeQuest'
  
  get '/home/makeQuest_failed'
  
  get '/home/my_page'
  
  get '/home/my_bbs'
  
  
  get '/index'=>'home#index'
  
  get '/signup'=>'home#signup'

  get '/login_design'=>'home#login_design'

  get '/makeQuest_new'=>'home#makeQuest_new'
  
  get '/makeQuest_quest'=>'home#makeQuest_quest'

  get '/makeQuest_success'=>'home#makeQuest_success'
  
  get '/makeQuest_failed' =>'home#makeQuest_failed'
  
  get '/my_page'=>'home#my_page'
  
  get '/credit' => "home#credit"
  
  get '/home/test'
  
  
  
  post '/home/makeQuest_quest/:quest_id/:user_id' => 'home#completeQuest'
  
  post '/home/create' => 'home#create'
  
  post '/upload' => 'home#completeQuest'
  get '/check' => 'photocomplete#check'
  get '/fail' => 'photocomplete#fail'
  get '/success' => 'photocomplete#success'
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
