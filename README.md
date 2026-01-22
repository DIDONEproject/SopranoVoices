# SopranoVoices

Repository reproducing the experiments from the paper:

> Llorens, A., García-Portugués, E., Vaquero, C., and Torrente, A. (2026). Soprano voices in opera seria: A corpus-based inquiry into eighteenth-century vocal types. *Submitted*.

To reproduce experiments, run `./experiments.sh` or execute the following block in R:

```r
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
      output_file = paste0("Experiment_", exp,"_", s, ".pdf")
    )
  }
}
```
