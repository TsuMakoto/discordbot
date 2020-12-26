module ReplyHandler

include("./MessageContents.jl")

using Discord

function call(c::Client, e::MessageCreate)
  body = e.message.content

  !ismissing(e.message.author.bot) && return

  ENV["BOT_NAME"] ∉ usernames(e.message.mentions) && return

  m = match(r"(?s)(?<=`{3}julia)(.+)(?=`{3})", body)

  reply_message = MessageContents.DEFAULT

  if !isnothing(m)
    cmd = Cmd(["julia", "-e", string(m[1])])
    reply_message = read(cmd, String)

    if reply_message == ""
      reply_message = MessageContents.REPLY
    end
  end

  # Add a reaction to the message.
  reply(c, e.message, reply_message)
end

usernames(mentions::Array{User, 1}) = map(mention -> mention.username, mentions)

end
