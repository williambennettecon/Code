## Function(s)
include("backward_iteration.jl")

function policy_ss(Π, a_grid, y, r, β, eis, tol=1e-9)
    # initial guess for Va: assume consumption 5% of cash-on-hand, then get Va from envelope condition
    coh = repeat(y,outer=(1,length(a_grid))) + (1+r)*repeat(a_grid', outer=(length(y),1));
    c = 0.05*coh;
    Va = (1+r)*c.^(-1/eis);
    
    # iterate until maximum distance between two iterations falls below tol, fail-safe max of 10,000 iterations
    a = 0;
    a_old = 0;
    for i in 1:10_000
        (Va, a, c) = backward_iteration(Va, Π, a_grid, y, r, β, eis);

        # after iteration 0, can compare new policy function to old one
        if maximum(abs.(a .- a_old)) < tol
            break
        else
            a_old = a;
        end
    end
    return(Va, a, c)
end