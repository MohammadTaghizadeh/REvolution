

# input type: sequence file
seq_ds_matrix <- function(file.address){
  seqpart <- readline( 'Choose one of these options,
                        form SType, UPID, EnName,
                        ProtName, OS, OX, GN,
                        PE, SV, SeqFASTA,
                        then, Enter your sequences: ')
## first step

  if(typeof(file.address) == 'list' ){array_seq <- file.address
  }else if(typeof(file.address) == 'character'){
    array_seq <- read.table(file.address, sep = '\t',
                              stringsAsFactors = F, quote = '')
    }


    first_mat_seq <- as.matrix(array_seq)
  ## getting sequence numbers
  seq_num_mat <- apply(first_mat_seq, 1, FUN = function(x) ifelse(
    substr(as.character(x), 1, 1)== '>', 1, 0))

  seq_num <- sum(seq_num_mat)

  seqs_df <- data.frame(matrix(0, seq_num, 10))
  colnames(seqs_df) <- c('SType', 'UPID', 'EnName', 'ProtName', 'OS', 'OX', 'GN',
                         'PE', 'SV', 'SeqFASTA')

  ## header separation function and implementing final data structure
  header_sep_f <- function(the_string){
    string_split_1 <- unlist(strsplit(the_string, split = ''))
    sepratores <- c('>', '|', '=', ' ')
    header_whiches <- lapply(sepratores, FUN = function(x) which(string_split_1==x))
    names(header_whiches) <-

      sepratores

    asubwhich <- c(1, header_whiches[[2]][1] + 1, header_whiches[[2]][2] + 1,
                   header_whiches[[4]][1] + 1, header_whiches[[3]][1] + 1,
                   header_whiches[[3]][2] + 1, header_whiches[[3]][3] + 1,
                   header_whiches[[3]][4] + 1, header_whiches[[3]][5] + 1)
    bsubwhich <- c(3, header_whiches[[2]][2] - 1, header_whiches[[4]][1] - 1,
                   header_whiches[[3]][1] - 4, header_whiches[[3]][2] - 4,
                   header_whiches[[3]][3] - 4, header_whiches[[3]][4] - 4,
                   header_whiches[[3]][5] - 4, header_whiches[[3]][5] + 1)
    out_mat <- matrix(0, 1, 10)
    out_mat[1, 1:9] <- (substr(rep(the_string, 9), asubwhich, bsubwhich))
    return(out_mat)
  }

  final_seq_list <- lapply(first_mat_seq[which(seq_num_mat==1)],
                           FUN = function(x) header_sep_f(x))
  seq_mat_all <- matrix(unlist(final_seq_list), ncol = seq_num, nrow = 10)
  seq_mat_all <- t(seq_mat_all)


  all_aaseqs <- function(whichaaseqs, seq_num_mat, first_mat_seq){
    whichaaseqs <- which(seq_num_mat==1)
    asubwhich <- c(whichaaseqs + 1)
    bsubwhich <- c(whichaaseqs[2:length(whichaaseqs)] - 1,
                  length(first_mat_seq))

    kkt <- mapply(asubwhich, bsubwhich,
                  FUN = function(x, y) paste0(first_mat_seq[x:y],
                  sep = '', collapse = ''))
    return(kkt)
}

  just_sequs <- all_aaseqs(whichaaseqs, seq_num_mat, first_mat_seq)
  seq_mat_all[, 10] <- just_sequs
  colnames(seq_mat_all) <- c('SType', 'UPID', 'EnName', 'ProtName',
                             'OS', 'OX', 'GN',
                             'PE', 'SV', 'SeqFASTA')
    selpart <- 0
    if(seqpart == 'SeqFASTA'){selpart <- 10
    }else if(seqpart == 'SType'){selpart <- 1
    }else if(seqpart == 'UPID'){selpart <- 2
    }else if(seqpart == 'EnName'){selpart <- 3
    }else if(seqpart == 'ProtName'){selpart <- 4
    }else if(seqpart == 'OS'){selpart <- 5
    }else if(seqpart == 'OX'){selpart <- 6
    }else if(seqpart == 'GN'){selpart <- 7
    }else if(seqpart == 'PE'){selpart <- 8
    }else if(seqpart == 'SV'){selpart <- 9
    }else (cat('Error'))

return(seq_mat_all[, selpart])
}



############################# function seq_to_tree ############################

seq_to_tree <- function(seqs, seqnames){
  library(ggdendro)
  library(ggplot2)
  meth = readline("select between:
                   complete, ward.D, ward.D2, single,
                   complete, average, mcquitty,
                   median, centroid ")
  sim_mat <- protr::parSeqSim(seqs, submat = 'BLOSUM80')
  colnames(sim_mat) <- seqnames
  rownames(sim_mat) <- seqnames


  dist_m <- data.matrix(sim_mat)

  hclust_input <- as.dist(1 - dist_m, diag = FALSE, upper = FALSE)
  ggdendrogram(hclust(hclust_input), size = 2)
  #par(mar = c(2,0,1,10))
  #plot(as.dendrogram(hclust(hclust_input, method = meth)), horiz = T)

}
















