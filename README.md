# Energy Arbitrage using Convex Optimization

Code repo: The convex optimization formulation is proposed using CVX toolbox for MATLAB.

Authors: Md Umar Hashmi, Arpan Mukhopadhyay, Ana Bu\v{s}i\'c, and Jocelyne Elias

INRIA, DI ENS, Ecole Normale Sup\'erieure, CNRS, PSL Research University, Paris, France

Contact: umar.hashmi123@gmail.com

## Introduction
We formulate energy storage arbitrage problem using convex optimization. 
This formulation is possible due to convex cost functions as the selling price is less than or equal to buying price.
In this formulation we consider: (a) net-metering compensation (with selling price at best equal to buying price) i.e. $\kappa_i \in [0,1]$, (b) inelastic load, (c) consumer renewable generation, (d) storage charging and discharging losses, (e) storage ramping constraint and (f) storage capacity constraint. 
Using numerical results we perform sensitivity analysis of energy storage batteries for varying ramp rates and varying ratio of selling and buying price of electricity.

Variables:
(i) p_b(i) Buying price at time instant i
(ii) p_s(i) Selling price at time instant i
(iii) z_i denotes net-load without storage output; it includes inelastic consumer load and consumer renewable generation
(iv) \kappa_i  is the ratio of selling price and buying price at time i
(v) \eta_{dis}, \eta_{ch}  charging and discharging efficiency of the battery
(vi) \kappa_i  is the ratio of selling price and buying price at time i
(vii) x_i denotes change in battery charge level at time instant i



## Code Dependencies
All code are implemented in MATLAB.

