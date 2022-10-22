function stationary_markov(Π)
    Π_lim = Π^(1_000*size(Π,1)^2);
    Π_lim = Π_lim[1,:];
    Π_stat = Π_lim./sum(Π_lim);
    return(Π_stat);
end