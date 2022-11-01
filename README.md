# chat-oxebanking
Conceitos de linguagem de programação - desenvolvimento de um chat para o aplicativo OxeBanking.

### Sprints:

- #### **Sprint 1**
  - Relatório sobre a linguagem de programação Julia.
- #### **Sprint 2**
  - Criada a estrutura inicial do projeto usando a arquitetura MVC, o web service inicia em http://127.0.0.1:3036. Para iniciar a aplicação sigas os passos indicados no tópic ***Carregando e iniciando aplicativos Genie.***
  - Criada a rota principal da aplicação em *routes.jl*.
  - Criada a conexão com o banco de dados MySQL. Para criar uma conexão com um banco de dados MySQL siga os passo do tópico ***Conexão com o banco de dados MySQL***.
- #### **Sprint 3**
  - 
- #### **Sprint 4**
  - 
- #### **Sprint 5**
  - 

#### Julia version

- Julia 1.8.1

#### Genie version

- Genie 5.11.0

#### SearchLight version

- SearchLight 2.10.0

#### SearchLightMySQL version

- SearchLightMySQL 2.4.1

#### Carregando e iniciando aplicativos Genie

- No Windows: usando o terminal acesse a pasta bin execute **server.bat**

- No MacOS/Linux: usando o terminal acesse a pasta bin execute **server**.

#### Conexão com o banco de dados MySQL

- Na pasta ***db*** acesse os arquivo ***connection.yml*** e insira os dados de conexão com o banco de dados: ***adapter***: MySQL (padrão do Genie para MySQL)
  ***database***: nome do banco de dados
  ***host***: 127.0.0.1 (localhost padrão)
  ***username***: nome de usuário
  ***password***: senha
  ***port***: 3306 (porta padrão para banco de dado MySQL)
- No terinal digite ***julia*** para acessar o ***REPL*** de linha de comando, em seguida digite os seguintes comandos em seuqência para iniciar a conexão com o banco de dados:  
  - ***using SearchLightMySQL***
  - ***using SearchLight***
  - ***config = SearchLight.Configuration.load()***
  - ***SearchLight.connect(config)***