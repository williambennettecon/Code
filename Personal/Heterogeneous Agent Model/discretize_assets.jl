function discretize_assets(amin, amax, n_a)
    # find maximum ubar of uniform grid corresponding to desired maximum amax of asset grid
    ubar = log(1 + log(1 + amax - amin));

    # make uniform grid
    u_grid = LinRange(0, ubar, n_a);
    
    # double-exponentiate uniform grid and add amin to get grid from amin to amax
    return amin .+ exp.(exp.(u_grid) .- 1) .- 1;
end