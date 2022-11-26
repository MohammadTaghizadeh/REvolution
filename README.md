# REvolution
REvolution

This package is for making phylogenetic trees from protein sequences as sequence file with FASTA format. 

To install the package, try:
devtools::install_github("MohammadTaghizadeh/REvolution")  

This project beggins recently, therefore, it will go under some changes in the future.

Usage:

library(REvolution)
data(P53_sequences)
seqs <- seq_ds_matrix(P53_sequences) #select SeqFASTA
seqnames <- seq_ds_matrix(P53_sequences) #select UPID
seq_to_tree(seqs, seqnames)
