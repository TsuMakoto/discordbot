module CmdExec

function call(usercmd::String)
  cmd = Cmd([
             "julia",
             "-E",
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
