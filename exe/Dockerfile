FROM julia:latest

WORKDIR /exe

RUN julia -e 'using Pkg; Pkg.add.("UnicodePlots"); Pkg.precompile()'
