FROM	    julia:1.10-bullseye
WORKDIR     ~/
COPY	    . ./
RUN         julia -e 'using Pkg; Pkg.add("PlutoSliderServer"); Pkg.update()'
ENTRYPOINT  ["julia", "-e", "using PlutoSliderServer; port = get(ENV, \"PORT\", \"8080\"); PlutoSliderServer.run_directory(\"./\", SliderServer_host=\"0.0.0.0\", SliderServer_port=parse(Int, port))"]

