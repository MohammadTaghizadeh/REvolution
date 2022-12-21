# Load raw data from .csv file
rRNA_sequences <- read.table("data-raw/complete.seq_filtertwo.txt", sep = '\t')
# Apply preprocessing...
# Save the cleaned data in the required R package location
usethis::use_data(rRNA_sequences)
setwd(paste(getwd, '/data_raw', sep = ''))

getwd()
