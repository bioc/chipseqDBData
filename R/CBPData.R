#' @export
#' @importFrom S4Vectors DataFrame
CBPData <- function() 
# Download the BAM files (and indices) for the CBP dataset.
{
     sra.codes <- c("SRR1145787", "SRR1145788", "SRR1145789", "SRR1145790")
     returned <- .linker(sra.codes)
     DataFrame(
        Name=sra.codes,
        Description=c(
            "CBP wild-type (1)",
            "CBP wild-type (2)",
            "CBP knock-out (1)",
            "CBP knock-out (2)"
        ),
        Path=returned
    )
}
