#' @export
#' @importFrom S4Vectors DataFrame
H3K4me3Data <- function() 
# Download the BAM files (and indices) for the H3K9ac dataset.
{
     files <- c("h3k4me3-proB-8110", "h3k4me3-proB-8115", "h3k4me3-matureB-8070", "h3k4me3-matureB-8088")
     returned <- .linker("h3k4me3/1.0.0", files)
     DataFrame(
        Name=files,
        Description=c(
            "pro-B H3K4me3 (8110)",
            "pro-B H3K4me3 (8115)",
            "mature B H3K4me3 (8070)",
            "mature B H3K4me3 (8088)"
        ),
        Path=returned
    )
}
