(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using Chat
const UserApp = Chat
Chat.main()
