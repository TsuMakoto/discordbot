module CodeBlockExecuter

include("./CodeBlockExecuter/ReplyHandler.jl")

using Discord

function call()
  # Create a client.
  c = Client(ENV["ACCESS_TOKEN"])
  # Add the handler.
  add_handler!(c, MessageCreate, ReplyHandler.call)
  # Log in to the Discord gateway.
  open(c)
  # Wait for the client to disconnect.
  wait(c)
end

end
