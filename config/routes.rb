Rails.application.routes.draw do
  mount Rswag::Api::Engine => "api-docs"
  mount Rswag::Ui::Engine => "api-docs"  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do  
    namespace :v1 do
      match 'repositories', controller: 'repositories', action: 'index', via: 'get'

      namespace :search do
        match 'repos', controller: 'repos', action: 'index', via: 'get'        
      end
    end
  end

end

