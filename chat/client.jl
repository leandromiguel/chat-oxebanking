import Sockets

const SERVER_HOST = Sockets.localhost
const SERVER_PORT = 8080

function enviarMensagem(socket, message)
    try
        println(socket, message)
    catch error
        @error error
        close(socket)
    end

    return nothing
end

function iniciarCliente(server_host, server_port)
    socket = Sockets.connect(server_host, server_port)

    @async while !eof(socket)
        println(readline(socket))
    end

    while isopen(socket)
        enviarMensagem(socket, readline())
    end

    return nothing
end

iniciarCliente(SERVER_HOST, SERVER_PORT)