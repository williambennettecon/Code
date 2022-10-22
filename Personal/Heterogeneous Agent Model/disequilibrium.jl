## Function(s)
include("discretize_assets.jl")
include("discretize_income.jl")
include("policy_ss.jl")
include("get_lottery.jl")
include("distribution_ss.jl")

function disequilibrium(r, a_min, a_max, a_size, ρ, σ, y_size, β, eis, α, δ)
    a_grid = discretize_assets(a_min, a_max, a_size);
    (y, π, Π) = discretize_income(ρ,σ,y_size);
    (Va, a, c) = policy_ss(Π, a_grid, y, r, β, eis, 1e-9)
    (a_i, a_π) = get_lottery(a, a_grid);
    D = distribution_ss(Π, a, a_grid);
    A = sum(D.*a);
    K = (α/(r+δ))^(1/(1-α));
    disequ = (K-A)^2;
    return(disequ)
end