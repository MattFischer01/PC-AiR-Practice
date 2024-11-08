data from https://www.cog-genomics.org/plink/2.0/resources#phase3_1kg
Callset: 
2022-08-04 Byrska-Bishop et al. (build 38, 3202 samples, contigs unphased)
 (main source, chrY/chrM/contigs source)
downloaded 2024-11-08

#ran these 2 commands to generate bed/bim/fam
plink2 --zst-decompress all_hg38.pgen.zst > all_hg38.pgen 
#required for plink2 to read .pgen
plink2 --pgen all_hg38.pgen --pvar all_hg38.pvar.zst --psam all_hg38.psam \
--remove deg2_hg38.king.cutoff.out.id --make-bed \
--out hg38_thinned --maf 0.01 --chr 1-22 \
--allow-extra-chr --max-alleles 2 --bp-space 10 --thin-count 100000
#bp-space:Remove variants so each pair is no closer than the given distance.
# 10 bp in this case, thins to make merge easier
#thin-count to reduce SNPs to only 100,000, reducing file size for PC-AiR practice

