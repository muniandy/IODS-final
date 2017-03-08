#Mahes Muniandy 30.01.2017 
# data wrangling for final exercise

#read the data
#setwd("E:/paper3/data version 4")
library(MASS)
library("parallel")
library("lme4")
library("GenABEL")

#We have multivariate data: clinical and metabolite data. 
#We have 80 individuals who are monozygotic twins. So, 40twin pairs.

metab <- read.table(file = "exercisefinal.txt",
                    header = TRUE,
                    dec = ".")
dim(metab)

#check metabolite values 
colSums(is.na(metab))
head(metab)
dim(metab)
colnames(metab)
rownames(metab)

#transform the data
metab$sex_final=as.factor(metab$sex_final)
metab$family_final=as.factor(metab$family_final)
metab$zyg=as.factor(metab$zyg)
metab$Smoking=as.factor(metab$Smoking)
metab$metabolite.BATCH=as.factor(metab$metabolite.BATCH)

#remove the metabolites with missing data
metab_1=metab[,c(-57,-68,-70,-93,-96,-101,-115,-116,-117,-118,-121,-125,-109,-97,-90, -73, -61,-56)]
head(metab_1)
colSums(is.na(metab_1))

#rename variables
names(metab_1)[2] <- "batch"
names(metab_1)[3] <- "family"
names(metab_1)[4] <- "sex"
colnames(metab_1)

#i want to remove some clinical variables from my analysis
metab_1=metab_1[,c(-5,-13,-14,-20,-21,-22,-23,-24,-25,-26,-27,-28,-29,-30)]

#write data to file
write.table(metab_1, file = "metabolites.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE) 


