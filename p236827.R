source("https://bioconductor.org/biocLite.R")
biocLite("IlluminaHumanMethylation450kanno.ilmn12.hg19")

library(dplyr)
library(IlluminaHumanMethylation450kanno.ilmn12.hg19)
data("IlluminaHumanMethylation450kanno.ilmn12.hg19")

query_cpgs <- c("cg23786580")
anno       <- IlluminaHumanMethylation450kanno.ilmn12.hg19 %>% 
              getAnnotation %>% 
              as.data.frame %>% 
              dplyr::slice(match(query_cpgs, Name))
