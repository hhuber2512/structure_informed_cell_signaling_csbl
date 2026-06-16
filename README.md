structure informed cell signaling

Code repository for "A multiscale, Bayesian inference approach to augment mechanistic models of cell signaling with machine-learning predictions of binding affinity" (Published in PLOS Computational Biology, DOI: https://doi.org/10.1371/journal.pcbi.1014321)

Hardware: results were produced using 2021 Apple M1 chip with 16 GB of memory.

Repository is divided into a few main folders:

ml_pipeline_predictor - files to reproduce comparison of structure-informed binding affinity predictions with uninformed prior as well as investigation of relationship between AlphaFold3 and PPI Affinity confidence metrics and accuracy of binding affinity predictions. Language: Python v3.13.2 (numpy and pandas) + Prism v10.4. All processed data and plots for these results are in the prism file, Python file 000 processes csv of binding affinity predictions that was then inputted into Prism. 

gpcr - gpcr test case, code to reproduce Bayesian inference on gpcr test case and analysis of resulting posteriors, including KL divergence and local sensitivity analysis. Language: Julia 

egfr - egfr test case, code to reproduce Bayesian inference on egfr test case and analysis of resulting posteriors, including KL divergence and local sensitivity analysis. Language: Julia 

To begin:

Generate Julia environment and then run add_packages.jl in the environment to install necessary package versions. Used Julia 1.11 here.

With Julia environment active, cd into either gpcr or egfr folders

From there, run 000 notebook - this will format experimental data for future analyses. Formatted data will appear in outputs

Run 100 notebook to check that experimental data looks like published data and that ODE models are simulating properly

Run various 2## notebooks to infer Bayesian posterior. For GPCR, numbers correspond to:
200 - augmented
201 - baseline
202 - augmented, wider prior
203 - baseline, wider prior
204 - augmented, narrower prior
205 - baseline, narrower prior
290 - augmented, reseeded
291 - baseline, reseeded
For EGFR, additional numbers correspond to:
230 - augmented, egfr test
231 - baseline, egfr test
232 - augmented, plcg test
233 - baseline, plcg test 
234 - augmented, grb2egfr test
235 - baseline, grb2egfr test 
236 - augmented, grb2shc test
237 - baseline, grb2shc test 
210 - augmented, weighed by AF3 ipTM 
220 - augmented, weighed by AF3 ranking score
270 - augmented, weighed by AF3 ranking score, reseeded
280 - augmented, weighed by AF3 ipTM, reseeded
292-296 - different mcmc hyper-parameters

Use run_300_400_500.jl file to run 300, 400, and 500 notebooks. Make sure to re-define "run" variable, which indicates posterior to analyze, each time. 
300 - format outputted posterior for next analyses
400 - compute convergence diagnostics (here, ESS)
500 - generate and format predictions for analysis

Use run_600 to run 600 notebook, which computes parameter and prediction quantiles, kl divergence between posteriors & sensitivity analyses. Must define run variables as well as prior distributions. Some analyses are pairwise, so you must specify a case were data is augmented with sequence or structure (augmented_run variable) and a case without augmentation (baseline_run variable). 

Finally, plot outputs of both EGFR and GPCR using plots.ipynb. Note that plots of all species predictions will be overwritten for different run numbers. Make sure to redefine run variables as needed. Plots aggregate across GPCR and EGFR test cases as well as compare between augmented and baseline data sets. Thus, four run variables are needed (augmented_run_egfr, baseline_run_egfr, augmented_run_gpcr, baseline_run_gpcr)
