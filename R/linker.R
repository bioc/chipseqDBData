#' @importFrom ExperimentHub ExperimentHub
.linker <- function(dataset, sra, outdir=tempfile(), hub=ExperimentHub())
# Creates links from the BAM files and indices.
{
    targets <- file.path("chipseqDBData", dataset, sprintf("%s.bam", sra))
    if (!file.exists(outdir)) {
        dir.create(outdir, showWarnings=FALSE)
    }
    output <- file.path(outdir, sprintf("%s.bam", sra))

    for (i in seq_along(targets)) {
        curtarget <- targets[i]
        outbam <- output[i]
        outbai <- paste0(outbam, ".bai")

        curbam <- hub[hub$rdatapath==curtarget][[1]]
        if (!file.link(curbam, outbam)) {
            stop(sprintf("failed to create link at '%s'", outbam))
        }

        curbai <- hub[hub$rdatapath==paste0(curtarget, ".bai")][[1]]
        if (!file.link(curbai, outbai)) {
            stop(sprintf("failed to create link at '%s'", outbai))
        }
    }

    output
}
