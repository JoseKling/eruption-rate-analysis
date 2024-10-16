# Apparently there are compatility issues with julia 1.11
FROM	    julia:1.10-bookworm
# Cloud Run looks for dependencies in a different folder. Fixing it manually
RUN         apt update -y && apt upgrade -y
RUN         mkdir /home/.julia && chmod 777 home/.julia
RUN         useradd -ms /bin/bash guest
USER        guest
ENV         JULIA_DEPOT_PATH=/home/.julia
WORKDIR     ~/app
COPY	    --chown=guest . ./
# Runs the code to precompile dependencies
RUN         julia --project=./ -e "using Pkg; Pkg.instantiate(); Pkg.precompile()"
# This only starts PlutoSliderServer
CMD         ["julia", "--project=./", "-e", "using PlutoSliderServer; PlutoSliderServer.run_directory(\"./\", SliderServer_port=8080, SliderServer_host=\"0.0.0.0\")"]
