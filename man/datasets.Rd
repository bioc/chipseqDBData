\name{chipseqDB datasets}
\alias{H3K9acData}
\alias{CBPData}
\alias{H3K4me3Data}
\alias{H3K27me3Data}
\alias{NFYAData}

\title{ChIP-seq DB datasets}
\description{Datasets for the \pkg{chipseqDB} workflow, to demonstrate detection of differential binding in ChIP-seq experiments.}

\usage{
H3K9acData()

CBPData()

H3K4me3Data()

H3K27me3Data()

NFYAData()
}

\value{
BAM files and associated index files are obtained via \pkg{ExperimentHub} if not already present.
Soft links to those files are created in \code{tempdir()} to ensure that each BAM file and its index have the same name.

A \linkS4class{DataFrame} is returned containing:
\itemize{
    \item \code{Name}, the name of the BAM file without the \code{*.bam} extension.
    \item \code{Description}, a short string containing the experimental condition and replicate number.
    \item \code{Path}, a string containing the path to the soft link for each BAM file.
}
}

\details{
\code{H3K9acData()} will download four H3K9ac ChIP-seq libraries, with two biological replicates of murine pro-B cells and another two replicates for mature B cells.
This uses single-end sequencing data from accession GSE38046 of the NCBI Gene Expression Omnibus.

\code{CBPData()} will download four CBP (CREB-binding protein) ChIP-seq libraries, with two biological replicates in each of wild-type and CBP-knockout mouse embryonic fibroblasts.
This uses single-end sequencing data from accession GSE54453 of the NCBI Gene Expression Omnibus.

\code{H3K4me3Data()} will download four H3K4me3 ChIP-seq libraries, with two biological replicates for murine pro-B and mature B cells.
This uses single-end sequencing data from accession GSE38046 of the NCBI Gene Expression Omnibus.

\code{H3K27me3Data()} will download four H3K27me3 ChIP-seq libraries, with two biological replicates for murine wild-type and Ezh2-knockout lung epithelium.
This uses single-end sequencing data from accession GSE57392 of the NCBI Gene Expression Omnibus.

\code{NFYAData()} will download five NF-YA (nuclear transcription factor Y subunit alpha) ChIP-seq libraries, with two biological replicates for murine terminal neurons, two replicates for embryonic stem cells and one input ontrol.
This uses single-end sequencing data from accession GSE25532 of the NCBI Gene Expression Omnibus.

All mouse datasets were aligned to the mm10 build of the mouse genome.
All BAM files are sorted and indexed, with duplicate reads marked with \code{MarkDuplicates}.
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

Tiwari VK, Stadler MB, Wirbelauer C et al. (2011).
A chromatin-modifying function of JNK during stem cell differentiation. 
\emph{Nat. Genet.} 44, 94-100.

Galvis LA, Holik AZ, Short KM et al. (2015).
Repression of Igf1 expression by Ezh2 prevents basal cell differentiation in the developing lung. 
\emph{Development} 142, 1458-69.
}

\examples{
H3K9acData()

\dontrun{
# And so on...
CBPData()

H3K4me3Data()

H3K27me3Data()

NFYAData()

}
}
