module CmdExec

function call(usercmd::String)
  cmd = Cmd([
             "julia",
             "-e",
             usercmd,
             ">",
             "result.txt",
             "&&",
             "cat",
             "result.txt"
            ])

  read(cmd, String)
end

end
