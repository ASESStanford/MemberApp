Rails.application.routes.draw do

  get 'user_role/edit'

  get 'user_role/json'

  get 'summit/create'

  get 'summit/new'

  get 'dashboard/index'

  post 'user_role/change_role', to: "user_role#change_role"

  get 'user_role/edit'

  get 'user_role/json', to: 'user_role#json'

  post 'summit/new', :to => "summit#create"

  get 'email/:id/choose', :to => "email#choose", as: 'email_choose'

  post 'email/:id/preview', :to => "email#preview", as: 'email_preview'

  post 'email/:id/send', :to => "email#send_email", as: 'email_send'

  get 'interview/:id/signup', :to => "interview#signup", as: 'interview_signup'

  get 'interview/:id/cancel', :to => "interview#cancel", as: 'interview_cancel'

  get 'interview/index'

  get 'interview/show'

  get 'interview/update'

  get 'interview/admin'

  get 'written_rating/edit'

  get 'written_rating/update'

  get 'written_rating/new'

  get 'question/review' => 'question#review'

  get '/application_submission_data/:form_id', to: 'application_submission#view_submissions'

  resources :application_submission, :question, :written_rating, :interview, :email, :application_form
  devise_for :users, :controllers => { registrations: 'registrations' }
  get "/application_create/:form_id/:user_id" => "application_submission#new_submission"
  get "/new_app_submission/:form_id" => "application_submission#new_user"
  get "/new_user" => "application_submission#new_admin"         #admin

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
