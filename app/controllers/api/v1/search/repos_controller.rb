class Api::V1::Search::ReposController < Api::V1::ApiController
    before_action :get_params, only: [:index]

    # GET /api/v1/search/repos?query=&language=&user=&page=&per_page=&sort=&order=
    def index
        require 'rest-client'
        require 'json'
        url   = 'https://api.github.com/search/repositories?'

        #Como  ficou montada a URL
        puts "#{url}q=#{@query}&page=#{@page}&per_page=#{@per_page}" + @sort + @order

        #Faz a requisição e renderiza o resultado como json
        ret   = RestClient.get "#{url}q=#{@query}&page=#{@page}&per_page=#{@per_page}" + @sort + @order
        items = catch_columns( JSON.parse(ret.body)["items"] )
        render json: items
    end
    
    private
        #busca parâmetros de busca
        def get_params        
            @query    = build_query()            
            @page     = (params[:page])     && params[:page]     != ''   ? params[:page]     : '1'
            @per_page = (params[:per_page]) && params[:per_page] != ''   ? params[:per_page] : '100'

            if (params[:sort]) && params[:sort] != ''
                @sort = "&sort=#{params[:sort]}"
                @order= (params[:order])    && params[:order]    != ''   ? "&order=#{params[:order]}"    : '&order=asc'
            else
                @sort = ''
                @order= ''
            end            
        end     

        # Monta a query com base nos parâmetros (freetext, language, user) recebidos
        def build_query
            #Consulta livre
            q = (params[:q]) && params[:q] != '' ? params[:q] + "+in:name,full_name,description+" : ''
            
            #Consulta por linguagem        
            language  = (params[:language]) ? "language:#{params[:language]}" : lang = "language:ruby"

            #Consulta por login do usuário
            if (params[:user])
                user  = params[:user] != '' ? "+user:#{params[:user]}" : ''
            else
                user  = ''
            end        
        
            #Monta query de busca
            return q + language + user            
        end

        #Seleciona colunas específicas
        def catch_columns(items)
            data = []

            for item in items
                data.push(  "full_name"         => item["full_name"], 
                            "description"       => item["description"],
                            "stargazers_count"  => item["stargazers_count"],
                            "forks_count"       => item["forks_count"],
                            "login"             => item["owner"]["login"]                            
                        )
            end
                        
            return data
        end        

        def require_authorization!
        unless current_user == @contact.user
            render json: {}, status: :forbidden
        end           
    end        
end