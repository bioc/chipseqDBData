#' @export
#' @importFrom S4Vectors DataFrame
H3K9acData <- function() 
# Download the BAM files (and indices) for the H3K9ac dataset.
{
     files <- c("h3k9ac-proB-8113", "h3k9ac-proB-8108", "h3k9ac-matureB-8059", "h3k9ac-matureB-8086")
     returned <- .linker("h3k9ac/1.0.0", files)
     DataFrame(
        Name=files,
        Description=c(
            "pro-B H3K9ac (8113)",
            "pro-B H3K9ac (8108)",
            "mature B H3K9ac (8059)",
            "mature B H3K9ac (8086)"
        ),
        Path=returned
    )
}
