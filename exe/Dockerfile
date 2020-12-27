FROM julia:latest

WORKDIR /exe

RUN julia -e 'using Pkg;            \
              Pkg.add.([            \
                  "UnicodePlots",   \
                  "TestImages",     \
                  "ImageInTerminal" \
                  "ImageMagick" \
              ]);                   \
Pkg.precompile()'
