module CodeBlockExecuter

using Discord


# Create a handler for the MessageCreate event.
function handler(c::Client, e::MessageCreate)
  body = e.message.content

  if !ismissing(e.message.author.bot)
    return
  end

  regex = r"(?s)(?<=run\n`{3}julia)(.+)(?=`{3})"
  m = match(regex, body)

  if isnothing(m)
    println("no match")
  else
    cmd = Cmd(["julia", "-e", string(m[1])])
    parseresult = read(cmd, String)

    # Add a reaction to the message.
    reply(c, e.message, parseresult)
  end
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
