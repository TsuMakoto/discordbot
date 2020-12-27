module CmdExec

function call(usercmd::String)
  cmd = Cmd([
             "docker",
             "run",
             "--rm",
             ENV["DOCKER_IMG_NAME"],
             "julia",
             "-E",
             usercmd
            ])
  run(pipeline(cmd, stdout="exe/out.txt"))

  read(`cat exe/out.txt`, String)
end

end
