class Api::V1::RepositoriesController < Api::V1::ApiController
    # GET /api/v1/repositories -- All public repositories
    def index                
        require 'rest-client'
        require 'json'
        url = 'https://api.github.com/repositories'

        #Trata parâmetro since (último repositório visto)
        @since = (params[:since]) && params[:since] != ''  ?  "?since=#{params[:since]}"  : ''

        #Como  ficou montada a URL
        puts "#{url}" + @since

        ret = RestClient.get "#{url}" + @since
        render json: ret.body
    end
    
    def require_authorization!
      unless current_user == @contact.user
        render json: {}, status: :forbidden
      end
    end    
        
end