module App

include("./CodeBlockExecuter.jl")
using CodeBlockExecuter

function call()
  CodeBlockExecuter.main()
end

end; App.call()
