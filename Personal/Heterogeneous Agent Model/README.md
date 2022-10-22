This folder contains contains Julia code that solves a standard heterogeneous agent model with idiosyncratic, but not aggregate, shocks. Specifically, this solves the Aiyagari (1993, 1994) model.

To use this code, you must have the "Interpolations" and "Optim" packages installed, have all the files in the same location, and run "hetero_solution".

The required inputs are various parameters related to househould preferences and firm technology as well as ones needed to discretize the asset and income state variables. The output is the equilibrium rate of return.

The code does three main things: first, for a given rate of return, it solves for the value and policy functions using the endogenous grid method; second, using the policy function, it finds the stationary distribution of assets and income using weighted lotteries; third, it repeatedly adjusts the rate of return and repeats steps one and two until the rate of return equilibrates the assets saved by the agents in the stationary distribution with the capital used by the firm by minimizing the square of the difference.
