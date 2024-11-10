## Github repo to create a tutorial for PC-AiR tool (Principal Component Analysis in Related Samples)

## What the repo includes:
### PCAIR.R
Code to run PC-AiR tool, allowing one to run a PCA analysis while accounting for related individuals. This creates a subset of unrelated and related individuals and runs principal compnent analysis (PCA) separately. PC-AiR is helpful for including related individuals in subsequent analysis without having to remove them.

### test-data
Includes 3 plink files (bed/bim/fam) from the 1000 Human Genomes Project, build 38. These plink files have been thinned to include only 100,000 SNPs, to reduce the file sizes. 

### pcair-results-plots
Includes 3 PC plots of the first 4 principal components following PCA of test-data, this can be used for reference to the plots that you generate. 