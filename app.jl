using Pkg
Pkg.activate(".")

include("./src/CodeBlockExecuter.jl")

CodeBlockExecuter.call()
