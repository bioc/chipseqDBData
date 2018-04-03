\name{chipseqDB datasets}
\alias{H3K9acData}
\alias{CBPData}

\title{chipseqDB datasets}
\description{Datasets for the \pkg{chipseqDB} workflow.}

\usage{
H3K9acData()

CBPData()
}

\value{
A character vector of paths to BAM files for each dataset is returned.
BAM files and associated index files are obtained from ExperimentHub, if not already present.
}

\details{
The H3K9ac dataset contains four H3K9ac ChIP-seq libraries, with two biological replicates of murine pro-B cells and another two replicates for mature B cells.
BAM files were obtained by aligning reads from accession GSE38046 of the NCBI Gene Expression Omnibus.

The CBP dataset contains four CBP (CREB-binding protein) ChIP-seq libraries, with two biological replicates in each of wild-type and CBP-knockout mouse embryonic fibroblasts.
BAM files were obtained by aligning reads from accession GSE54453 of the NCBI Gene Expression Omnibus.

In both cases, BAM files are single-end, sorted and indexed.
Index files are named by appending \code{.bai} onto the BAM file paths.
}

\author{
Aaron Lun
}

\references{
Revilla-I-Domingo R, Bilic I, Vilagos B, Tagoh H et al. (2012).
The B-cell identity factor Pax5 regulates distinct transcriptional programmes in early and late B lymphopoiesis. 
\emph{EMBO J.} 31, 3130-46.

Kasper LH, Qu C, Obenauer JC, McGoldrick DJ et al. (2014).
Genome-wide and single-cell analyses reveal a context dependent relationship between CBP recruitment and gene expression. 
\emph{Nucleic Acids Res} 42, 11363-82.
}

\examples{
h3k9ac.paths <- H3K9acData()

cbp.paths <- CBPData()
}
