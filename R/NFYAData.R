#' @export
#' @importFrom S4Vectors DataFrame
NFYAData <- function() 
# Download the BAM files (and indices) for the NF-YA dataset.
{
     sra.codes <- c("SRR074398", "SRR074399", "SRR074417", "SRR074418", "SRR074401")
     returned <- .linker("nfya/1.0.0", sra.codes)
     DataFrame(
        Name=sra.codes,
        Description=c(
            "NF-YA ESC (1)",
            "NF-YA ESC (2)",
            "NF-YA TN (1)",
            "NF-YA TN (2)",
            "Input"
        ),
        Path=returned
    )
}
