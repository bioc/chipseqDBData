#' @importFrom ExperimentHub ExperimentHub
#' @importFrom AnnotationHub query
.linker <- function(dataset, sra, outdir=tempfile(fileext="_chipseqDBData"), hub=ExperimentHub())
# Creates links from the BAM files and indices.
{
    targets <- file.path("chipseqDBData", dataset, sra)
    if (!file.exists(outdir)) {
        dir.create(outdir, showWarning=FALSE)
    }
    output <- file.path(outdir, sra)

    for (i in seq_along(targets)) {
        curtarget <- targets[i]
        curoutput <- output[i]

        curbam <- query(hub, paste0(curtarget, ".bam"))[[1]]
        outbam <- paste0(curoutput, ".bam")
        if (!file.symlink(curbam, outbam)) {
            stop(sprintf("failed to create symbolic link at '%s'", outbam))
        }

        curbai <- query(hub, paste0(curtarget, ".bai"))[[1]]
        outbai <- paste0(curoutput, ".bai")
        if (!file.symlink(curbai, outbai)) {
            stop(sprintf("failed to create symbolic link at '%s'", outbai))
        }
    }

    output
}
