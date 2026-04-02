options(repos = c(CRAN = "https://cloud.r-project.org"))

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

cran_pkgs <- c(
  "dplyr",
  "tidyr",
  "ggplot2",
  "ggrepel",
  "pheatmap",
  "viridisLite",
  "matrixStats",
  "gplots",
  "RColorBrewer",
  "devtools"
)

bioc_pkgs <- c(
  "edgeR",
  "topGO",
  "clusterProfiler",
  "Rgraphviz",
  "org.Mm.eg.db",
  "org.Hs.eg.db",
  "ComplexHeatmap",
  "WGCNA",
  "impute",
  "preprocessCore",
  "KEGGREST"
)

installed <- rownames(installed.packages())

to_install_cran <- setdiff(cran_pkgs, installed)
if (length(to_install_cran) > 0) {
  install.packages(to_install_cran)
}

installed <- rownames(installed.packages())
to_install_bioc <- setdiff(bioc_pkgs, installed)
if (length(to_install_bioc) > 0) {
  BiocManager::install(to_install_bioc, ask = FALSE, update = FALSE)
}

installed <- rownames(installed.packages())
if (!"pathview" %in% installed) {
  devtools::install_github("javadnoorb/pathview")
}

pkgs_to_load <- c(
  "edgeR",
  "topGO",
  "clusterProfiler",
  "dplyr",
  "tidyr",
  "Rgraphviz",
  "org.Mm.eg.db",
  "org.Hs.eg.db",
  "ggplot2",
  "ComplexHeatmap",
  "ggrepel",
  "WGCNA",
  "pheatmap",
  "viridisLite",
  "matrixStats",
  "gplots",
  "impute",
  "preprocessCore",
  "devtools",
  "KEGGREST"
)

for (p in pkgs_to_load) {
  suppressPackageStartupMessages(library(p, character.only = TRUE))
}

message("All requested workshop packages are installed and loaded.")
sessionInfo()
