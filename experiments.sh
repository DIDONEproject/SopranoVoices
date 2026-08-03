#!/bin/bash

# Script to run the soprano voice experiments.
# Renders Models.qmd once per experiment.

set -euo pipefail

Rscript -e '
for (exp in 1:3) {
  message("Rendering for experiment: ", exp)
  quarto::quarto_render(
    input = "Models.qmd",
    execute_params = list(experiment = exp),
    output_file = paste0("Experiment_", exp, ".pdf")
  )
}
'
