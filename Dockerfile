# Apparently there are compatility issues with julia 1.11
FROM	    julia:latest
# Cloud Run looks for dependencies in a different folder. Fixing it manually
ENV         JULIA_DEPOT_PATH=~/.julia

# Create a non-root user
WORKDIR     ~/app
COPY	    . ./

# Runs the code to precompile dependencies
RUN         julia julia_build_script 
# This only starts PlutoSliderServer
ENTRYPOINT  julia julia_entry_script
