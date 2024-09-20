FROM	    julia:1.10-bookworm # Apparently there are compatility issues with julia 1.11
ENV         JULIA_DEPOT_PATH=/home/.julia # Cloud Run looks for dependencies in a different folder. Fixing it manually
COPY	    . ./
RUN         julia julia_build_script # Runs the code to precompile dependencies
ENTRYPOINT  julia julia_entry_script # This only starts PlutoSliderServer
