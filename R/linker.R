#' @importFrom S4Vectors List
#' @importFrom Rsamtools BamFile
#' @importFrom ExperimentHub ExperimentHub
.linker <- function(dataset, sra, outdir=NA_character_, hub=ExperimentHub()) {
    targets <- file.path("chipseqDBData", dataset, sprintf("%s.bam", sra))
    output <- List()

    for (i in seq_along(targets)) {
        curtarget <- targets[i]
        curbam <- hub[hub$rdatapath==curtarget][[1]]
        curbai <- hub[hub$rdatapath==paste0(curtarget, ".bai")][[1]]
        output[[i]] <- BamFile(curbam, index=curbai)
    }

    output
}
