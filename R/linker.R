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

        tmpbam <- tempfile(fileext=".bam")
        file.symlink(curbam, tmpbam) || file.copy(curbam, tmpbam)
        tmpbai <- tempfile(fileext=".bam.bai")
        file.symlink(curbai, tmpbai) || file.copy(curbai, tmpbai)

        output[[i]] <- BamFile(tmpbam, index=tmpbai)
    }

    output
}
