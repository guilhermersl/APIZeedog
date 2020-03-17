Rails.application.routes.draw do
  #post 'user_token' => 'user_token#create'
  #devise_for :users
  mount Rswag::Api::Engine => "api-docs"
  mount Rswag::Ui::Engine => "api-docs"  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do  
    namespace :v1 do
      #Autenticação
      match 'authenticate', controller: 'authentication', action: 'authenticate', via: 'post'              
      #Lista de Repositórios Públicos
      match 'repositories', controller: 'repositories', action: 'index', via: 'get'
      #Busca por repositórios      
      namespace :search do
        match 'repos', controller: 'repos', action: 'index', via: 'get'     
      end

    end
  end
end

