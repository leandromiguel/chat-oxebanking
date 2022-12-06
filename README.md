# chat-oxebanking
Conceitos de linguagem de programação - desenvolvimento de um chat para o aplicativo OxeBanking.

### Sprints:

- #### **Sprint 1**
  - Relatório sobre a linguagem de programação Julia.
- #### **Sprint 2**
  - Criada a estrutura inicial do projeto.
  - Criada o server.jl.
  - Criada a conexão com o banco de dados MySQL (conexão ainda apresentando erros).
- #### **Sprint 3**
  - Criada a migration messages.jl para testar a conexão e inserção no banco de daos.
  - A conexão com o banco de dados é realizada com sucesso mas a execussão da migration messages.jl falha por algum motivo. (Uma outra forma de inserção será testada e caso não surta efeito um utro banco de dados será testado)
- #### **Sprint 4**
  - Mudança na estrutura do projeto.
  - Mudança do banco de dados MySQL para SQLite (Poblema de conexão resolvido).
  - Alteração na forma de conexão e criação das tabelas no banco.
  - Execução da migration messages.jl realizada com sucesso (Mensagens sendo inseridos no banco de dados com sucesso).
- #### **Sprint 5**
  - Implementação do client.jl com as funções de iniciar o client.jl e enviar mensagem.
- #### **Sprint 6**
  - Implementção das seguintes funções do servidor: enviar_mensagem, sair_do_chat, conectar e iniciarServidor 
- #### **Sprint 7**
  - Resumo da linguagem utilizada, o que foi feito (implementação), experiência utilizando a linguagem

#### Julia version

- Julia 1.8.1

#### Genie version

- Genie 5.11.0

### Getting Started

Siga estas etapas para testar o chat em seu localhost:

1. Clone o projeto

    ```
    $ git clone https://github.com/leandromiguel/chat-oxebanking.git
    ```

1. Vá para o diretório do projeto (`chat-oxebanking/chat`) e inicie o Julia REPL

    ```
    $ julia
    ```

1. Ative e instancie o projeto do Julia REPL

    ```
    julia> import Pkg; Pkg.activate("."); Pkg.instantiate()
    ```

    Isso irá gerar um arquivo `Manifest.toml` dentro do diretório.

1. Saia do REPL

1. Execute `server.jl` no seu terminal
    ```
    $ julia --project=. server.jl
    ```

    Espere até o servidor começar a ouvir.

1. Execute `client.jl` em alguns terminais diferentes e comece a conversar.
    ```
    $ julia --project=. client.jl
    ```

    Você deverá inserir um nome de usuário. O nome deve ser composto apenas por letras maiúsulas ou minúsculas e seu comprimento deve ser de 1 a 32 caracteres

Vários clientes podem conectar e desconectar e o servidor continuará funcionando. Pressione `Ctrl-c` para sair do servidor.
