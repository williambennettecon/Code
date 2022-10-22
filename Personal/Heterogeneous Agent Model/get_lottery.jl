function get_lottery(a, a_grid)
    # step 1: find the i such that a' lies between gridpoints a_i and a_(i+1)
    # note that the lower bound is on the true grid and endogenous grid
    # must be careful and assign all probability to it
    a_i = searchsortedfirst.(Ref(a_grid), a) .- 1;

    # step 2: obtain lottery probabilities π
    a_π = Matrix{Float64}(undef,size(a,1),size(a,2));
    for i in 1:size(a,1)
        for j in 1:size(a,2)
            if a_i[i,j] == 0;
                a_π[i,j] = 1.0;
            else
                a_π[i,j] = (a_grid[a_i[i,j]+1] - a[i,j])/(a_grid[a_i[i,j]+1] - a_grid[a_i[i,j]]);
            end
        end
    end

    return(a_i, a_π)
end