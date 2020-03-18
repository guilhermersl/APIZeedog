# API GitHub Zee Dog

Aplicação de busca de repositórios do GitHub.
Esta aplicação realiza consulta aos repositórios do GitHub, por meio de endpoints específicos.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://apizeedog.herokuapp.com/api-docs/index.html)



## Documentação:
*   É possível acessar a documentação da API, com endpoints, autenticação, parâmetros de buscas, entre outras informações, em: https://apizeedog.herokuapp.com/api-docs/index.html



## EndPoints:
*Base URL: apizeedog.herokuapp.com/api/v1*


**[POST] /authenticate**

Realiza autenticação como pré-requisito para todos os endpoints.

*Procedimentos:*

    1º - Informe email e password no body da requisição. Ex.: {"email":"email@mail.com","password":"123456"}

    2º - Efetue a requisição.

    3º - Copie o "auth_token" gerado.

    4º - Caso esteja usando o Swagger, clique em Authorize e informe o "auth_token" copiado. Caso esteja executando via Postman ou efetuando um curl, basta colar o "auth_token" no campo Authorization do header das requisições desejadas.



**[GET] /repositories**  

Lista repositórios públicos do GitHub.

*Requer autenticação:* Procedimento descrito no endpoint de Autenticação.

*Filtros (opcionais):*

    since (query parameter)

        id do repositório inicial a ser buscado. 
        
        Por exemplo, ?since=50 representa listagem todos os repositórios públicos a partir do repositório de id 50.

        Ex.: apizeedog.herokuapp.com/api/v1/repositories?since=20



 
**[GET] /search/repos =>**      

Faz busca por repositórios segundo parâmtros de busca, e permite ordenação e paginação desses repositórios.
        
*Requer autenticação:* Procedimento descrito no endpoint de Autenticação.
    
*Filtros (opcionais):*

    q (query parameter)
    
        filtrar por texto livre

        Ex.: apizeedog.herokuapp.com/api/v1/search/repos?q=zeedog


    language (query parameter)
    
        Filtrar por linguagem de programação utilizada. Valor default é ruby.
        
        Ex.: apizeedog.herokuapp.com/api/v1/search/repos?language=ruby


    user (query parameter)
    
        Filtrar por proprietário do repositório

        Ex.: apizeedog.herokuapp.com/api/v1/search/repos?user=guilhermersl


    page (query parameter)
    
        Define paginação à lista de repositórios retornada. Valor default é 1.
        
        Ex.: apizeedog.herokuapp.com/api/v1/search/repos?page=5&per_page=100
        
        
    per_page (query parameter)
    
        Define o total de repositórios a ser retornado por página. Informe-o junto com o parâmetro "page". Valor default é 100.
        
        Ex.: apizeedog.herokuapp.com/api/v1/search/repos?page=5&per_page=100


    sort (query parameter)
    
        Permite ordenar o resultado pela quantidade de estrelas(stars), pela quantidade de forks(forks) ou pela última atualização(updated).
                                                               
        Ex.: apizeedog.herokuapp.com/api/v1/search/repos?sort=forks 


    order (query parameter)
    
        Define a orientação da ordenação. Podendo ser ascendente(asc) ou descendente(desc).
        
        Ex.: apizeedog.herokuapp.com/api/v1/search/repos?sort=forks&order=asc


**Obs.: os parâmetros são opcionais e acumulativos. Asism, seria possível definir, por exemplo: apizeedog.herokuapp.com/api/v1/search/repos?language=ruby&sort=forks&order=asc**

                                                                    

## Ruby on Rails

A aplicação foi desenvolvida usando a linguagem Ruby no Rails.


## PostgreSQL

A aplicação foi desenvolvida usando o Banco de dados PostgreSQL.


## Instalação

1. Baixe o conteúdo do repositório 'apizeedog' do GitHub (https://github.com/guilhermersl/APIZeedog.git)
2. Descompacte o arquivo baixado, localize-o no local acessível pela Web. Suponha que a localização seja c:/sites/, por exemplo.
3. 


## Heroku

URL = https://apizeedog.herokuapp.com/api-docs/index.html

