## Functions
include("get_lottery.jl")
include("stationary_markov.jl")
include("forward_iteration.jl")

function distribution_ss(Π, a, a_grid, tol=1e-10)
    (a_i, a_π) = get_lottery(a, a_grid);

    # as initial D, use stationary distribution for s, plus uniform over a
    π = stationary_markov(Π);
    D = repeat(π,outer=(1,length(a_grid)))./sum(repeat(π,outer=(1,length(a_grid))));

    # now iterate until convergence to acceptable threshold
    D_new = 0;
    for i in 1:10_000
        D_new = forward_iteration(D, Π, a_i, a_π)
        if maximum(abs.(D_new - D)) < tol
            break
        else
            D = D_new
        end
    end
    return(D_new)
end