## Function(s)
include("forward_policy.jl")

function forward_iteration(D, Π, a_i, a_π)
    Dend = forward_policy(D, a_i, a_π);
    return(Π'*Dend)
end