CBPData <- function() 
# Download the BAM files (and indices) for the H3K9ac dataset.
# Return their paths in a character vector. 
{
     hub <- ExperimentHub()
     files <- c("SRR1145787", "SRR1145788", "SRR1145789", "SRR1145790")
     bam.files <- paste0(files, ".bam")
     bai.files <- paste0(bam.files, ".bai")

     for (x in seq_along(files)) {
         bam.files[i] <- query(hub, bam.files[x])[[1]]
         bai.files[i] <- query(hub, bai.files[x])[[1]]
     }

     return(bam.files)
}
