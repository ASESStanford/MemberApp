Rails.application.routes.draw do

  get 'interview/:id/signup', :to => "interview#signup", as: 'interview_signup'

  get 'interview/index'

  get 'interview/show'

  get 'interview/update'

  get 'written_rating/edit'

  get 'written_rating/update'

  get 'written_rating/new'

  get 'question/review' => 'question#review'

  resources :application_submission, :question, :written_ratings, :interview
  devise_for :users, :controllers => { registrations: 'registrations' }

  #get '/application_submission/:id/edit', to: 'application_submission#edit', as: 'application_submission'

  get 'application/index'

  get 'application/new'

  get 'application/edit'

  get 'welcome/index'

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
