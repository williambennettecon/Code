## Package(s)
using Optim

## Function(s)
include("disequilibrium.jl")

function r_equ(a_min=0, a_max=1000, a_size=500, ρ=0.975, σ=0.7, y_size=7, β=0.98, eis=1.0, α=0.36, δ=0.08)
    res = optimize(r -> disequilibrium(r, a_min, a_max, a_size, ρ, σ, y_size, β, eis, α, δ), -0.9999*δ, 0.9999*(1/β - 1), rel_tol = 1e-8);
    r_equ = Optim.minimizer(res);
    return(r_equ)
end