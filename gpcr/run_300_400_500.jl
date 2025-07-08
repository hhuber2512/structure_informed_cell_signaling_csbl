using NBInclude

#change run variable as needed
run = 200
@nbinclude("300_process_posterior_samples.ipynb")
@nbinclude("400_posterior_convergence_diagnostics.ipynb")
@nbinclude("500_generate_predictions.ipynb")
