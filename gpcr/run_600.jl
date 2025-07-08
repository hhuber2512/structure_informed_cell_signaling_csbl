using NBInclude
include("target_probability.jl")

#for analysis needing pairs (augmented and baseline comparison)
augmented_run = "200"
baseline_run = "201"
prior_nonbinding_offset = [2,2]
prior_binding_offset = [0,0]
prior_bounds = return_prior_bounds_empirical(prior_nonbinding_offset, prior_binding_offset);
@nbinclude("600_analysis.ipynb")

augmented_run = "204"
baseline_run = "205"
bound_offset = [1,1]
binding_bound_offset = [-1,-1]
prior_bounds = return_prior_bounds_empirical(bound_offset, binding_bound_offset) #for target probability
prior_bounds[1] = return_prior_bounds_empirical(bound_offset, [0,-2])[1] #shrink kon by 2 orders of magnitude, keeping ground truth in range
@nbinclude("600_analysis.ipynb")

augmented_run = "202"
baseline_run = "203"
prior_nonbinding_offset = [3,3]
prior_binding_offset = [1,1]
prior_bounds = return_prior_bounds_empirical(prior_nonbinding_offset, prior_binding_offset);
@nbinclude("600_analysis.ipynb")