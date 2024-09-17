FROM	    julia:1.10
WORKDIR     /notebooks
COPY	    FrequencyAnalysis.jl HypothesisTesting.jl .
RUN         julia -e 'using Pkg; Pkg.add("Pluto"); Pkg.add("PlutoSliderServer"); Pkg.update()'
EXPOSE      8080
ENTRYPOINT  julia -e 'using PlutoSliderServer; PlutoSliderServer.run_directory("./", SliderServer_host="0.0.0.0", SliderServer_port=8080)'

