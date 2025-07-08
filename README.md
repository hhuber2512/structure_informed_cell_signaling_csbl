structure informed cell signaling

Code repository for Multiscale Probabilistic Modeling: A Bayesian Approach to Augment Mechanistic Models of Cell Signaling with Machine-Learning Predictions of Binding Affinity (Preprint DOI: https://doi.org/10.1101/2025.05.23.655795)

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
210 - augmented, weighed by AF3 ipTM 
220 - augmented, weighed by AF3 ranking score
270 - augmented, weighed by AF3 ranking score, reseeded
280 - augmented, weighed by AF3 ipTM, reseeded
292-296 - different mcmc hyper-parameters

Use run_300_400_500.jl file to run 300, 400, and 500 notebook, re-defining "run" variable, which indicates posterior to analyze, each time. 
300 - format outputted posterior for next analyses
400 - compute convergence diagnostics (here, ESS)
500 - generate and format predictions for analysis

Use run_600 to run 600 notebook, which computes parameter and prediction quantiles, kl divergence between posteriors & sensitivity analyses. Hyperparameters for "run" variable are included in this script. 

Finally, plot outputs of both EGFR and GPCR using plots.ipynb. Note that plots of all species predictions will be overwritten for different run numbers.
