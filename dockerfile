FROM	    julia:1.10
COPY	    FrequencyAnalysis.jl HypothesisTesting.jl ~/notebooks/
WORKDIR     ~/notebooks/
RUN         julia -e 'using Pkg; Pkg.add("Pluto"); Pkg.add("PlutoSliderServer"); Pkg.update()'
EXPOSE      8080
ENTRYPOINT  julia -e 'using PlutoSliderServer; PlutoSliderServer.run_directory("./", SliderServer_host="0.0.0.0", SliderServer_port=8080)'

