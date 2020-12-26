module CodeBlockExecuter

include("./MessageContents.jl")
using .MessageContents

using Discord

# Create a handler for the MessageCreate event.
function handler(c::Client, e::MessageCreate)
  body = e.message.content

  if !ismissing(e.message.author.bot)
    return
  end

  if ENV["BOT_NAME"] ∉ map(mention -> mention.username, e.message.mentions)
    return
  end

  regex = MessageContents.REGEX

  m = match(regex, body)

  reply_message = MessageContents.DEFAULT

  if !isnothing(m)
    cmd = Cmd(["julia", "-e", string(m[1])])
    parseresult = read(cmd, String)

    if parseresult != ""
      reply_message = MessageContents.REPLY
    end
  end

  # Add a reaction to the message.
  reply(c, e.message, reply_message)
end

function main()
  # Create a client.
  c = Client(ENV["ACCESS_TOKEN"])
  # Add the handler.
  add_handler!(c, MessageCreate, handler)
  # Log in to the Discord gateway.
  open(c)
  # Wait for the client to disconnect.
  wait(c)
end

end
