Rails.application.routes.draw do
  root :to => 'issues#list_page'
  
  resources :issues do
    member do
     get :show  
    end
    
    collection do
      get :index
      get '/issues/list_page' => 'issues#list_page', :as => :list_page
    end
  end
  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :issues do
        member do
          get :show
        end
        collection do
          get :index
          post :create
        end
      end
    end
  end
end
