Receituario::Application.routes.draw do

  resources :clinicas do
    member do
      get 'medicos_da_clinica'
    end
    resources :medicos do
      member do
        get 'alocar_medico'
        get 'desalocar_medico'
        get 'alterar_clinica'
        get 'salvar_clinica'
      end
    end
  end

  resources :usuarios

  match '/signin',  :to => 'sessions#new'
  match '/signout',  :to => 'sessions#destroy'

  resources :sessions

  resources :farmacias do
    
    member do
      get 'funcionarios'
    end

    resources :farmaceuticos do
      member do
        get 'alocar_farmaceutico'
        get 'desalocar_farmaceutico'
        get 'alterar_farmacia'
        get 'salvar_farmacia'
      end
    end
    
    resources :balconistas do
      member do
        get 'alocar_balconista'
        get 'desalocar_balconista'
        get 'alterar_farmacia'
        get 'salvar_farmacia'
      end
    end
  end

  resources :pacientes

  resources :receitas do
    get "atender"
  end

  root :to => "pages#home"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
