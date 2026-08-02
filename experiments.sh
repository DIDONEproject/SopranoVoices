#!/bin/bash

# Script to run the soprano voice experiments.
# Renders Models.qmd once per (experiment, subset) combination.

set -euo pipefail

Rscript -e '
exps <- 1:3
subsets <- c(
  "Sop_features_non_cat"
)
for (exp in exps) {
  for (s in subsets) {
    message("Rendering for experiment: ", exp, " and subset: ", s)
    quarto::quarto_render(
      input = "Models.qmd",
      execute_params = list(experiment = exp, subset_name = s),
      output_file = paste0("Experiment_", exp, "_", s, ".pdf")
    )
  }
}
'
