# Apparently there are compatility issues with julia 1.11
FROM	    julia:1.10-bookworm
ENV         JULIA_DEPOT_PATH=/home/.julia
COPY	    . ./
# PlutoSliderServer is the only dependency
RUN         julia julia_build_script
# If environment variable 'PORT' is not set, default to port 8080, which is the default in cloud run
ENTRYPOINT  julia julia_entry_script

