library(limma)
set.seed(1234)
pheno_table            <- data.frame(Rep      = c(paste0("A",1:8)), 
                                     Variable = c("A","B","C","C","C","D","D","D"))
mat_rows               <- 100
matrix_in              <- matrix(log2(rnorm(n = (mat_rows*nrow(pheno_table)), mean = 100, sd = 30)), nrow = mat_rows)
design                 <- model.matrix(~0 + Variable, data = pheno_table)
colnames(design)       <- gsub("Variable", "", colnames(design))
contrasts              <- c("A_Vs_B" = "B-A")
contrast_mat           <- makeContrasts(contrasts = contrasts, levels = colnames(design))
colnames(contrast_mat) <- names(contrasts)
fit                    <- eBayes(contrasts.fit(lmFit(matrix_in, design),contrast_mat))
topTable(fit, coef = 1, number = 5, p.value = 0.1)

#      logFC  AveExpr        t      P.Value  adj.P.Val         B
# 92 -2.909594 6.21836 -4.935319 0.0009739746 0.09739746 -0.3183399