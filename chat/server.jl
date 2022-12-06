import Sockets

using SQLite

#Obter ip: localhost, Sockets.ip ou getipaddr()
const SERVER_HOST = Sockets.localhost
const SERVER_PORT = 8080

#cria o banco de dados caso não exista Message.sqlite3
db = SQLite.DB("Message.sqlite3")
#cria a tabela messages no banco de dados caso não exista
SQLite.execute(db, "CREATE TABLE IF NOT EXISTS messages(ID INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, mensagem TEXT)")

#Enviar mensagem para um dado socket
function enviar_mensagem(socket, message)
    #Controle de fluxo - tratamento de exceções - "try/catch statement"
    try
        println(socket, message)
    catch error
        #Macro padrão de erro
        @error error
        close(socket)
    end
    return nothing
end

#Função de saída do chat
function sair_do_chat(room, room_lock, socket, username)

    user_exit_message = "[$(username) saiu da sala!]"
    lock(room_lock) do
        pop!(room, socket)
        mensagem_para_todos(room, user_exit_message)
    end

    close(socket)

    return nothing
end

#Envia a mensagem a todos do server
function mensagem_para_todos(room, message)
    @info message

    for socket in room
        enviar_mensagem(socket, message)
    end

    return nothing
end

#Função de Conexão
function conectar(room, room_lock, socket, peername)
    @async begin
        #Btem o nome do usuário
        enviar_mensagem(socket, "Digite seu nome:")
        username = readline(socket)

        #Expressão regular para verificar se o nome do usuário é composto por letras e tem até 32 caracteres
        if occursin(r"^[a-zA-Z]{1,32}$", username)
            user_entry_message = "[Conectado, $(username) entrou na sala!]"

            lock(room_lock) do
                push!(room, socket)
                mensagem_para_todos(room, user_entry_message)
                enviar_mensagem(socket, "Para sair do chat digite '@SAIR'")
            end

            while !eof(socket)
                user_message = readline(socket)

                if all(char -> isprint(char) && isascii(char), user_message)

                    if cmp(user_message, "@SAIR") == 0
                        break
                    else
                        broadcast_message = "$(username): $(user_message)"
                        #Insere as mensagens no banco de dados
                        SQLite.execute(db, "INSERT INTO messages(nome, mensagem) VALUES(?, ?)", (username, user_message))
                        lock(room_lock) do
                            mensagem_para_todos(room, broadcast_message)
                        end
                    end

                else
                    @info "$(peername) mensagem inválida."
                    enviar_mensagem(socket, "[ERRO: Caracteres inválidos]")
                    close(socket)
                    break
                end
            end

            sair_do_chat(room, room_lock, socket, username)

        else
            @info "(ip,socket) = $(peername): Falha de conexão, usuário com nome inválido."


            enviar_mensagem(socket, "ERRO: Usar caracteres de a-z, A-Z, sem acentos e de Tamanho[Mín,Máx][1,32]")

            sleep(1)

            conectar(room, room_lock, socket, peername)

        end

        @info "(ip,socket) = $(peername) Desconectado "
    end
end

#Iniciar servidor
function iniciarServidor(server_host, server_port)
    room = Set{Sockets.TCPSocket}()

    room_lock = ReentrantLock()

    server = Sockets.listen(server_host, server_port)
    @info "Server iniciado com sucesso!"

    while true
        socket = Sockets.accept(server)

        peername = Sockets.getpeername(socket)
        @info "(ip,socket) = $(peername) Esperando conexão"

        conectar(room, room_lock, socket, peername)
    end

    return nothing
end

iniciarServidor(SERVER_HOST, SERVER_PORT)