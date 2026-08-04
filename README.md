# SopranoVoices

Repository reproducing the experiments from the paper:

> Llorens, A., García-Portugués, E., Vaquero, C., and Torrente, A. (2026). Soprano voices in opera seria: A corpus-based inquiry into eighteenth-century vocal types. *Submitted*.

## Data

The data source is `sopranovoices.csv`: 1,682 soprano arias with nine metadata columns (`AriaId`, `ariaTitle`, `AriaOpera`, `Character`, `Gender`, `Composer`, `Year`, `Singer`, `Sex`) and the 567 principal-soprano `musif` features (`PartSop_*`). The dataset is deposited on Zenodo under [10.5281/zenodo.21757127](https://doi.org/10.5281/zenodo.21757127) (CC BY 4.0) and is cited as:

> Llorens, A., García-Portugués, E., Vaquero, C., and Torrente, A. (2026). *Soprano voices in opera seria: dataset of musical features and metadata for 1,682 arias* (Version 2.0) [Data set]. Zenodo. <https://doi.org/10.5281/zenodo.21757127>

`experiments.qmd` downloads the data from Zenodo the first time it is rendered, verifies its MD5 checksum, and reuses the local copy on every later run, so no manual download is needed.

The three experiment subsets are derived inside `experiments.qmd`: (1) all arias, target = character gender; (2) arias whose character gender aligns with the premiering singer's sex, target = character gender; (3) arias with a known singer, target = singer's sex.

## Reproducing the experiments

From the repository root:

```sh
./experiments.sh
```

This renders `experiments.qmd` once per experiment (1-3) and writes:

| Output | Contents |
| --- | --- |
| `experiment_<n>.pdf` | Full report per experiment |
| `preprocessed_datasets/` | Baked train / test / combined designs |
| `results/dataset_summary/` | Corpus-description tables of the paper (written in the experiment-1 pass) |
| `results/experiments/` | Test-set metrics and model comparisons |
| `results/final_model/` | Ridge fit on all data (coefficient CIs; in-sample metrics for reference only) |
| `results/y_hats/` | Per-model test-set predictions |
| `plots/` | Coefficient plots and the vocal-ranges figure |

`experiments.sh` is the single source of truth for the render loop; edit the experiment list there rather than duplicating it elsewhere.

### Requirements

R (>= 4.4), [Quarto](https://quarto.org), a LaTeX engine providing `xelatex`, and the R packages `knitr`, `dplyr`, `recipes`, `rsample`, `yardstick`, `glmnet`, `ggplot2`, `caret`, `randomForest`, `tibble` and `quarto`.
