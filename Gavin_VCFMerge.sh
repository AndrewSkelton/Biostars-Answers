#!/bin/bash

# Assuming you're doing this from FMSCluster, log into a node to do the compute.
qlogin

# Change directory to where you have your VCF files
cd WORKING_DATA/Blah/VCF-Files

# Add the VCFTools module
module add apps/vcftools/0.1.12b

# If you have standard VCF files, you'll need to compress and index them to work with vcftools
for i in ./*.vcf
do
  bgzip ${i}
  tabix -c vcf ${i}.gz
done

# For the sake of simplicity, say you have 3 VCF files SAM_A.vcf, SAM_B.vcf, and SAM_C.vcf
# and you want to make a multi sample VCF.
vcf-merge SAM_A.vcf.gz SAM_B.vcf.gz SAM_C.vcf.gz | bgzip -c > out.vcf.gz
