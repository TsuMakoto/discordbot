module ReplyHandler

include("./MessageContents.jl")
include("./CmdExec.jl")

using Discord

function call(c::Client, e::MessageCreate)
  body = e.message.content

  !ismissing(e.message.author.bot) && return

  ENV["BOT_NAME"] ∉ usernames(e.message.mentions) && return

  m = match(r"(?s)(?<=`{3}julia)(.+)(?=`{3})", body)

  reply_message = MessageContents.DEFAULT

  if !isnothing(m)
    cmd = string(m[1])
    # if ngword(cmd) || parse_ngword(cmd)
    #   create(c, Reaction, e.message, "😡")
    #   return
    # end

    reply_message = CmdExec.call(cmd)

    if reply_message == ""
      reply_message = MessageContents.REPLY
    end
  end

  # Add a reaction to the message.
  reply(c, e.message, reply_message)
end

usernames(mentions::Array{User, 1}) = map(mention -> mention.username, mentions)

# ngword(cmd::String) = begin
#   matched = match(r"run(.+)", cmd)
#
#   !isnothing(matched) && return true
#
#   matched = match(r"read(.+)", cmd)
#
#   !isnothing(matched) && return true
#
#   matched = match(r"open(.+)", cmd)
#
#   !isnothing(matched) && return true
#
#   return false
# end
#
# parse_ngword(cmd::String) = begin
#   parse_cmd = match(r"(?<=parse\()(.+)(?=\))", cmd)
#
#   isnothing(parse_cmd) && return false
#
#   parse_cmd[1] |> Meta.parse |> eval |> ngword
# end

end
