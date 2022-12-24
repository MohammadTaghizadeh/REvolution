# Load raw data from .csv file
rRNA_5S_sequences <- read.table("data-raw/5S_RNAs_from_RNA_central.txt", sep = '\t')
# Apply preprocessing...
# Save the cleaned data in the required R package location
usethis::use_data(rRNA_5S_sequences)

