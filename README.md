# SopranoVoices

Repository reproducing the experiments from the paper:

> Llorens, A., García-Portugués, E., Vaquero, C., and Torrente, A. (2026). Soprano voices in opera seria: A corpus-based inquiry into eighteenth-century vocal types. *Submitted*.

## Reproducing the experiments

From the repository root:

```sh
./experiments.sh
```

This renders `Models.qmd` once per experiment (1-3) and writes:

| Output | Contents |
| --- | --- |
| `Experiment_<n>_<subset>.pdf` | Full report per experiment |
| `preprocessed_datasets/` | Baked train / test / combined designs |
| `results/experiments/` | Test-set metrics and model comparisons |
| `results/final_model/` | Ridge fit on all data (in-sample, for reference only) |
| `results/y_hats/` | Per-model test-set predictions |
| `plots/` | Coefficient plots |

`experiments.sh` is the single source of truth for the render loop; edit the
experiment and subset lists there rather than duplicating them elsewhere.

### Requirements

R (>= 4.4), [Quarto](https://quarto.org), a LaTeX engine providing `xelatex`,
and the R packages `knitr`, `dplyr`, `recipes`, `rsample`, `yardstick`,
`glmnet`, `ggplot2`, `caret`, `randomForest`, `tibble` and `quarto`.
