## Function(s)
include("rouwenhorst_Π.jl")
include("stationary_markov.jl")
    
function discretize_income(ρ, σ, n_s)
    # choose inner-switching probability p to match persistence rho
    p = (1+ρ)/2;

    # start with states from 0 to n_s-1, scale by alpha to match standard deviation sigma
    s = LinRange(0, n_s-1, n_s)
    alpha = 2*σ/sqrt(n_s-1)
    s = alpha*s;

    # obtain Markov transition matrix Π and its stationary distribution
    Π = rouwenhorst_Π(n_s,p);
    π = stationary_markov(Π);

    # s is log income, get income y and scale so that mean is 1
    y = exp.(s);
    y /= (π'*y);

    return(y,π,Π)
end