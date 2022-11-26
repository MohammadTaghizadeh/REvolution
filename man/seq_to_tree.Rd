\name{seq_to_tree}
\alias{seq_to_tree}
\title{seq_ds_matrix is for getting sequences from a file and give a matrix of 10 parts of FASTA sequences.}
\usage{
seq_to_tree(exampleData[,10], exampleData[,2])
}
\description{
Output will be a phylogenetic tree for input sequences.
}
\examples{
## not to be run
library(REvolution)
data(P53_sequences)
seqs <- seq_ds_matrix(P53_sequences) #select SeqFASTA
seqnames <- seq_ds_matrix(P53_sequences) #select UPID
seq_to_tree(seqs, seqnames)
## not to be run
}
