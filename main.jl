using Pkg # Starts the package manager
Pkg.activate("./") # Activates the environment in the current folder
Pkg.instantiate()
Pkg.precompile()
using PlutoSliderServer # Imports PlutoSliderServer

function julia_main()
    port = get(ENV, "PORT", "8080") # In case the environment variable 'PORT' is set. Otherwise use port 8080
    PlutoSliderServer.run_directory("./", 
                                    SliderServer_host="0.0.0.0",
                                    SliderServer_port=parse(Int, port)) # Starts the server
end
