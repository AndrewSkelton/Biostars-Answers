source("https://bioconductor.org/biocLite.R")
biocLite("IlluminaHumanMethylation450kanno.ilmn12.hg19")

library(dplyr)
library(readr)
library(IlluminaHumanMethylation450kanno.ilmn12.hg19)
data("IlluminaHumanMethylation450kanno.ilmn12.hg19")

#Manually Enter CpGs
query_cpgs <- c("cg23786580")

#Read in CpGs from File
#Extract the "CpGs" Column
query_cpgs <- read_csv("my_cpgs.csv") %>% 
              as.data.frame %>% 
              .[["CpGs"]]

anno       <- IlluminaHumanMethylation450kanno.ilmn12.hg19 %>% 
  getAnnotation %>% 
  as.data.frame %>% 
  dplyr::slice(match(query_cpgs, Name))