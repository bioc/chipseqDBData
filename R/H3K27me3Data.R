#' @export
#' @importFrom S4Vectors DataFrame
H3K27me3Data <- function() 
# Download the BAM files (and indices) for the H3K9ac dataset.
{
     sra.codes <- c("SRR1274188", "SRR1274189", "SRR1274190", "SRR1274191")
     returned <- .linker("h3k27me3/1.0.0", sra.codes)
     DataFrame(
        Name=sra.codes,
        Description=c(
            "control H3K27me3 (1)",
            "control H3K27me3 (2)",
            "Ezh2 knock-out H3K27me3 (1)",
            "Ezh2 knock-out H3K27me3 (2)"
        ),
        Path=returned
    )
}
