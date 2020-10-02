#' @importFrom ExperimentHub ExperimentHub
.linker <- function(dataset, sra, outdir=tempfile(), hub=ExperimentHub())
# Creates links from the BAM files and indices.
{
    targets <- file.path("chipseqDBData", dataset, sprintf("%s.bam", sra))
    if (!file.exists(outdir)) {
        dir.create(outdir, showWarnings=FALSE)
    }
    output <- file.path(outdir, sprintf("%s.bam", sra))
    FUN <- .linkFUN()

    for (i in seq_along(targets)) {
        curtarget <- targets[i]
        outbam <- output[i]
        outbai <- paste0(outbam, ".bai")

        curbam <- hub[hub$rdatapath==curtarget][[1]]
        FUN(curbam, outbam)

        curbai <- hub[hub$rdatapath==paste0(curtarget, ".bai")][[1]]
        FUN(curbai, outbai)
    }

    output
}

.linkFUN <- function() 
# Return a function to use hard/soft links depending on the OS.
{
    if (.Platform$OS.type=="windows") {
        function(from, to) {
            if (!file.symlink(from, to) && !file.link(from, to) && !file.copy(from, to)) {
                stop(sprintf("failed to create link at '%s'", to))
            }
            invisible(NULL)
        }
    } else {
        function(from, to) {
            if (!file.symlink(from, to)) {
                stop(sprintf("failed to create symbolic link at '%s'", to))
            }
            invisible(NULL)
        }
    }
}
