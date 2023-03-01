#This script is for calculating the alpha diversity index from count data obtained from metagenomics data (microbiome).

devtools::install_github("")

library(readr)
library(vegan)
library(readxl)
library(xlsx)
library(ggplot2)
#read excel sheet
otu_table <- read.csv("GM_count_table_estimate_read_values_2_20230103.csv",header =T, row.names=1)
dim(otu_table)
data_richness <- estimateR(otu_table)
data_evenness <- diversity(otu_table) / log(specnumber(otu_table)) 
data_shannon <- diversity(otu_table, index = "shannon")  
data_alphadiv <- cbind(t(data_richness), data_shannon, data_evenness)
rm(otu_table)

rm(data_richness, data_evenness, data_shannon)           

write.csv(data_alphadiv,"data_alphadiv_GM_20230116.csv")

