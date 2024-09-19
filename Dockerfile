# Apparently there are compatility issues with julia 1.11
FROM	    julia:1.10-bookworm
COPY	    . ./
# PlutoSliderServer is the only dependency
RUN         julia -e 'using Pkg; Pkg.add("PlutoSliderServer"); Pkg.update()'
# If environment variable 'PORT' is not set, default to port 8080, which is the default in cloud run
ENTRYPOINT  julia -e 'using PlutoSliderServer; port = get(ENV, "PORT", "8080"); PlutoSliderServer.run_directory("./", SliderServer_host="0.0.0.0", SliderServer_port=parse(Int, port))'

