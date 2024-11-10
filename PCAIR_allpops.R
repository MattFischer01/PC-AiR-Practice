#The following code allows you to run the PC-AiR tool on the latest build from 1000 Human Genomes project \
#This data has been thinned to 100,000 SNPs to reduce the data file sizes. 
#In order to run, download the test-data, that contains the plink files hg38_thinned. \
#Once you download the files, update the necessary paths, replacing "/path/to/" 
#Reference your PC-AiR plot results with the results provided in the git repository. 

#Install GENESIS packages
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# The following initializes usage of Bioc devel
BiocManager::install(version='devel')

BiocManager::install("GENESIS")

#Open necessary libraries for the code 
library(GENESIS)
library(SNPRelate)
library(GWASTools)
library(dplyr)
library(tibble)

#Convert PLINK files to GDS object. Outputs a GDS file to the written path folder. 
snpgdsBED2GDS(bed.fn = "/path/to/hg38_thinned.bed", 
              bim.fn = "/path/to/hg38_thinned.bim", 
              fam.fn = "/path/to/hg38_thinned.fam", 
              out.gdsfn = "/path/to/genotype.gds")

#Clear any previous opened GDS files
##Not needed for the first run through, but good practice. 
showfile.gds(closeall=TRUE)

#Open GDS file that you created above
gdsfile <- "/path/to/genotype.gds"
gds <- snpgdsOpen(gdsfile)

#LD Pruning - creates a list of high linkage disequilibrium SNPs to exclude while running pcair 
snpset <- snpgdsLDpruning(gds, method="corr", slide.max.bp=10e6,
                          ld.threshold=sqrt(0.1), verbose=FALSE)
pruned <- unlist(snpset, use.names=FALSE)

#Save the list as an RDS file for future reference (if needed), outputs the RDS file to the written path folder. 
saveRDS(pruned,"/path/to/pruned_set.RDS")

#Calculate the kinship coefficients 
king <- snpgdsIBDKING(gds)

#Saves kinship column to new dataframe to use for pcair function. Also adds necessary column and row names to run.
kingMat <- king$kinship 
colnames(kingMat)<-king$sample.id
row.names(kingMat)<-king$sample.id

#Save king RDS file for future reference (if needed), outputs the RDS file to the written path folder.
saveRDS(king, file = "/path/to/King_matrix.RDS")

#Close all previously opened GDS files
showfile.gds(closeall=TRUE)

#Create genotype object needed for pcair function
geno <- GdsGenotypeReader(filename = "/path/to/genotype.gds") 
genoData <- GenotypeData(geno)

#Run PCAIR with the necessary objects created above. 
mypcair <- pcair(genoData, kinobj = kingMat, divobj = kingMat, snp.include = pruned)

# plot top 2 PCs
plot(mypcair)
# plot PCs 2 and 3
plot(mypcair, vx = 2, vy = 3)
# plot PCs 3 and 4
plot(mypcair, vx = 3, vy = 4)
