## Function(s)
include("r_equ.jl")

# parameters
a_min = 0;
a_max = 1000;
a_size = 500;
ρ = 0.975;
σ = 0.7;
y_size = 7;
β = 0.98;
eis = 1.0;
α = 0.36;
δ = 0.08;

r_star = r_equ(a_min, a_max, a_size, ρ, σ, y_size, β, eis, α, δ);
