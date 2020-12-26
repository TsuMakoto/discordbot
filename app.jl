using Pkg
Pkg.activate(".")
Pkg.API.precompile()

include("./src/CodeBlockExecuter.jl")

CodeBlockExecuter.call()
