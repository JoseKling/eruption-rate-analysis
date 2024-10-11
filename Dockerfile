# Apparently there are compatility issues with julia 1.11
FROM	    julia:1.10-bookworm
# Cloud Run looks for dependencies in a different folder. Fixing it manually
ENV         JULIA_DEPOT_PATH=/home/.julia
WORKDIR     /app
COPY	    . ./
# Runs the code to precompile dependencies
RUN         julia julia_build_script
# This only starts PlutoSliderServer
ENTRYPOINT  julia julia_entry_script
