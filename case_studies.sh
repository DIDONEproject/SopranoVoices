#!/bin/bash

# Script to run the soprano voice case studies.
# Renders case_studies.qmd once per case study.

set -euo pipefail

Rscript -e '
for (cs in 1:3) {
  message("Rendering for case study: ", cs)
  quarto::quarto_render(
    input = "case_studies.qmd",
    execute_params = list(case_study = cs),
    output_file = paste0("case_study_", cs, ".pdf")
  )
}
'
