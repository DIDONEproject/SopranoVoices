# SopranoVoices

Repository reproducing the case studies from the paper:

> Llorens, A., García-Portugués, E., Vaquero, C., and Torrente, A. (2026). Soprano voices in opera seria: A corpus-based inquiry into eighteenth-century vocal types. *Submitted*.

## Data

The data source is `sopranovoices.csv`: 1,682 soprano arias with nine metadata columns (`AriaId`, `ariaTitle`, `AriaOpera`, `Character`, `Gender`, `Composer`, `Year`, `Singer`, `Sex`) and the 567 principal-soprano `musif` features (`PartSop_*`). The dataset is deposited on Zenodo under [10.5281/zenodo.21757127](https://doi.org/10.5281/zenodo.21757127) (CC BY 4.0) and is cited as:

> Llorens, A., García-Portugués, E., Vaquero, C., and Torrente, A. (2026). *Soprano voices in opera seria: dataset of musical features and metadata for 1,682 arias* (Version 2.0) [Data set]. Zenodo. <https://doi.org/10.5281/zenodo.21757127>

`case_studies.qmd` downloads the data from Zenodo the first time it is rendered, verifies its MD5 checksum, and reuses the local copy on every later run, so no manual download is needed.

The three case study subsets are derived inside `case_studies.qmd`: (1) all arias, target = character gender; (2) arias whose character gender aligns with the premiering singer's sex, target = character gender; (3) arias with a known singer, target = singer's sex.

## Reproducing the case studies

From the repository root:

```sh
./case_studies.sh
```

Alternatively (e.g. on Windows, where the shell script is not available), execute the following block in R from the repository root:

```r
for (cs in 1:3) {
  message("Rendering for case study: ", cs)
  quarto::quarto_render(
    input = "case_studies.qmd",
    execute_params = list(case_study = cs),
    output_file = paste0("case_study_", cs, ".pdf")
  )
}
```

Either route renders `case_studies.qmd` once per case study (1-3) and writes:

| Output | Contents |
| --- | --- |
| `case_study_<n>.pdf` | Full report per case study |
| `preprocessed_datasets/` | Baked train / test / combined designs |
| `results/dataset_summary/` | Corpus-description tables of the paper (written in the case-study-1 pass) |
| `results/case_studies/` | Test-set metrics and model comparisons |
| `results/final_model/` | Ridge fit on all data (coefficient CIs; in-sample metrics for reference only) |
| `results/y_hats/` | Per-model test-set predictions |
| `plots/` | Coefficient plots and the vocal-ranges figure |

`case_studies.sh` is the reference render loop; if the case study list changes, update it there first and keep the R block above in sync.

### Requirements

R (>= 4.4), [Quarto](https://quarto.org), a LaTeX engine providing `xelatex`, and the R packages `knitr`, `dplyr`, `recipes`, `rsample`, `yardstick`, `glmnet`, `ggplot2`, `caret`, `randomForest`, `tibble` and `quarto`.
