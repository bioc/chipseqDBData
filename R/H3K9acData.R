H3K9acData <- function() 
# Download the BAM files (and indices) for the H3K9ac dataset.
# Return their paths in a character vector. 
{
     hub <- ExperimentHub()
     files <- c("proB-8113", "proB-8108", "matureB-8059", "matureB-8086")
     bam.files <- paste0(files, ".bam")
     bai.files <- paste0(bam.files, ".bai")

     for (x in seq_along(files)) {
         bam.files[i] <- query(hub, bam.files[x])[[1]]
         bai.files[i] <- query(hub, bai.files[x])[[1]]
     }

     return(bam.files)
}
