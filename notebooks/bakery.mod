param N; # number of samples

param c;
param p;
param h;

set indices := 1..N;
param xi{indices};

# first stage variable: x (amount of fish bought)
var x integer >=0;

var first_stage_profit = -c * x;

# second stage variables: y (sold) and z (unsold)
var y{indices} integer >=0;
var z{indices} integer >=0;

# second stage constraints
s.t. cantsellbaguettedonthave {i in indices}: y[i] <= xi[i];
s.t. baguettedonotdisappear {i in indices}: y[i] + z[i] == x;

var second_stage_profit = sum{i in indices}(p * y[i] - h * z[i]) / N;

# objective
maximize total_expected_profit: first_stage_profit + second_stage_profit;
