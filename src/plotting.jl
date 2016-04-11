using KernelDensity
using PyPlot

KernelDensity.kde(t::BenchmarkTools.Trial) = kde(t.times)
PyPlot.plot(t::BenchmarkTools.Trial) = plt[:scatter](0:length(t)-1, t.times)
PyPlot.plot(k::KernelDensity.UnivariateKDE) = PyPlot.plot(k.x, k.density)

function pltlintrial(b, logscale = true; kwargs...)
    times, evals = BenchmarkTools.lineartrial(b; kwargs...)
    plt[:scatter](evals, times ./ evals)
    logscale && (plt[:yscale]("log"); plt[:xscale]("log"))
end
