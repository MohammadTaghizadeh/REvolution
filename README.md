# REvolution
REvolution
![phylo_tree_01](https://user-images.githubusercontent.com/118055241/206899425-6eb7dd98-3fbf-4bd4-ac38-58a4af539aa8.jpg)
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

-------------------------------------------------
Data included in this package are P53_sequences and rRNA_sequences.
rRNA sequences have been filtered so they are all complete sequences and not included on any N nucleotides.
