function rouwenhorst_Π(N, p)
    # base case Π_2
    Π = [p 1-p; 1-p p];

    # recursion to build up from Π_2 to Π_N
    for n in 3:N
        z = zeros(n-1,1);
        Π = p*[[Π z] ; [z' 0]] + (1-p)*[[z Π] ; [0 z']] + (1-p)*[[z' 0] ; [Π z]] + p*[[0 z'] ; [z Π]];
        Π[2:n-1,:] /= 2;
    end

    return(Π);
end