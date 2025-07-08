using NBInclude

#run analysis script on pair of approaches. Hyperparameters included. See read me for breakdown of what numbers correspond to

#analysis needs pairs (augmented data and baseline data comparison)
augmented_run = "200" #can also be 210 or 220
baseline_run = "201"
prior_nonbinding_offset = [2,2]
prior_binding_offset = [0,0];
@nbinclude("600_analysis.ipynb")

#narrow prior
augmented_run = "204"
baseline_run = "205"
prior_nonbinding_offset  = [1,1]
prior_binding_offset = [0,0] #will be set later
bound_offset = [1,1]
binding_bound_offset = [0,0]; #will be set later
prior_bounds = return_prior_bounds_empirical(bound_offset, binding_bound_offset) #for target probability
#redefine narrow koff bounds
koff_i = return_koff_indices()
prior_bounds[koff_i] = return_prior_bounds_empirical(bound_offset, [-2,0])[koff_i] 
#redefine k12b bounds, so that reported value is within the prior bounds
prior_bounds[koff_i[2]] = return_prior_bounds_empirical(bound_offset, [-1,-1])[koff_i[2]] 
#redefine narrow kon bounds
kon_i = return_kon_indices()
prior_bounds[kon_i] = return_prior_bounds_empirical(bound_offset, [-1,-1])[kon_i]
#redefine k13f bounds, so that reported value is within the prior bounds
prior_bounds[kon_i[3]] = return_prior_bounds_empirical(bound_offset, [-2,0])[kon_i[3]];

#wide prior
augmented_run = "202"
baseline_run = "203"
bound_offset = [3,3]
binding_bound_offset = [1,1]
prior_bounds = return_prior_bounds_empirical(bound_offset, binding_bound_offset); #for target probability