## Principal Component Analysis in Related Samples - PC-AiR
PC-AiR is a tool that allows one to account for family structure when running a principal component analysis (PCA). PCAs are highly sensistive to population structure and relatedness can become a significant feature (or principal component), which will lead to related individuals being outliers during plotting. To combat these familial outliers in the principal components, researchers will often exclude individuals with high relatedness in the datasets, thus, decreasing the available data that can be used in subsequent analysis and modeling. With PC-AiR, researchers can account for related individuals in their PCAs, allowing those individuals to remain within the dataset. 

## What the repo includes:
### PCAIR.R
R script to run PC-AiR tool, which is included in the GENESIS package, https://github.com/UW-GAC/GENESIS?tab=readme-ov-file. PC-AiR allows one to run a PCA while accounting for related individuals. PC-AiR creates a subset of unrelated and related individuals using kinship coefficients. Then, performs PCA on the unrelated subset, then imputes PC values of the related subset from genetic similarity. Upon plotting your principal components, related individuals will be denoted with a + and unrelated individuals with a period. 

### test-data
Includes 3 plink files (bed/bim/fam) from the 1000 Human Genomes Project, build 38. These plink files have been thinned to include only 100,000 SNPs, to reduce the file sizes. 

### pcair-results-plots
Includes 3 PC plots of the first 4 principal components following PCA of test-data, this can be used for reference to the plots that you generate. 