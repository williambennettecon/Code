## Package(s)
using Interpolations

function backward_iteration(Va, Π, a_grid, y, r, β, eis)
    # step 1: discounting and expectations
    Wa = β*Π*Va;

    # step 2: solving for asset policy using the first-order condition
    c_endog = Wa.^(-eis);
    coh = repeat(y,outer=(1,length(a_grid))) + (1+r)*repeat(a_grid', outer=(length(y),1));

    a = Matrix{Float64}(undef,size(coh,1),size(coh,2));
    for s in 1:length(y)
        itp = LinearInterpolation(c_endog[s,:]+a_grid, a_grid, extrapolation_bc=Line());
        a[s,:] = itp.(coh[s,:]);
    end

    # step 3: enforcing the borrowing constraint and backing out consumption
    a = max.(a, a_grid[1]);
    c = coh - a;

    # step 4: using the envelope condition to recover the derivative of the value function
    Va = (1+r)*c.^(-1/eis)

    return(Va,a,c)
end