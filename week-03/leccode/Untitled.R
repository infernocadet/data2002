dat = matrix(c(69, 2, 65, 6), nrow = 2)
colnames(dat) = c("Has lung cancer (cases)", "Does not have lung cancer (controls)")
rownames(dat) = c("Smoker", "Non-smoker")
dat
fisher.test(dat)