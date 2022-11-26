# Load raw data from .csv file
P53_sequences <- read.table("P53_sequences.txt", sep = '\t')
# Apply preprocessing...
# Save the cleaned data in the required R package location
usethis::use_data(P53_sequences)
