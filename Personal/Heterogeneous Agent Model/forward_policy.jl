function forward_policy(D, a_i, a_π)
    a_i = max.(1,a_i);
    Dend = zeros(size(a_i,1),size(a_i,2));
    for s in 1:size(a_i,1)
        for a in 1:size(a_i,2)
            # send π(s,a) of the mass to gridpoint i(s,a)
            Dend[s,a_i[s,a]] += a_π[s,a]*D[s,a]

            # send 1-π(s,a) of the mass to gridpoint i(s,a)+1
            Dend[s,a_i[s,a]+1] += (1-a_π[s,a])*D[s,a]
        end
    end

    return(Dend)
end