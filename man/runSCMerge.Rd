% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runBatchCorrection.R
\name{runSCMerge}
\alias{runSCMerge}
\title{Apply scMerge batch effect correction method to SingleCellExperiment object}
\usage{
runSCMerge(
  inSCE,
  useAssay = "logcounts",
  batch = "batch",
  assayName = "scMerge",
  hvgExprs = "counts",
  seg = NULL,
  kmeansK = NULL,
  cellType = NULL,
  BPPARAM = BiocParallel::SerialParam()
)
}
\arguments{
\item{inSCE}{Input \linkS4class{SingleCellExperiment} object}

\item{useAssay}{A single character indicating the name of the assay requiring
batch correction. Default \code{"logcounts"}.}

\item{batch}{A single character indicating a field in
\code{\link{colData}} that annotates the batches.
Default \code{"batch"}.}

\item{assayName}{A single characeter. The name for the corrected assay. Will
be saved to \code{\link{assay}}. Default \code{"scMerge"}.}

\item{hvgExprs}{A single characeter. The assay that to be used for highly
variable genes identification. Default \code{"counts"}.}

\item{seg}{A vector of gene names or indices that specifies SEG (Stably
Expressed Genes) set as negative control. Pre-defined dataset with human and
mouse SEG lists is available with \code{\link[scMerge]{segList}} or
\code{\link[scMerge]{segList_ensemblGeneID}}. Default
\code{NULL}, and this value will be auto-detected by default with
\code{\link[scMerge]{scSEGIndex}}.}

\item{kmeansK}{An integer vector. Indicating the kmeans' K-value for each
batch (i.e. how many subclusters in each batch should exist), in order to
construct pseudo-replicates. The length of \code{kmeansK} needs to be the same
as the number of batches. Default \code{NULL}, and this value will be
auto-detected by default, depending on \code{cellType}.}

\item{cellType}{A single character. A string indicating a field in
\code{colData(inSCE)} that defines different cell types. Default
\code{'cell_type'}.}

\item{BPPARAM}{A \linkS4class{BiocParallelParam} object specifying whether
should be parallelized. Default \code{BiocParallel::SerialParam()}.}
}
\value{
The input \linkS4class{SingleCellExperiment} object with
\code{assay(inSCE, assayName)} updated.
}
\description{
The scMerge method leverages factor analysis, stably expressed genes (SEGs)
and (pseudo-) replicates to remove unwanted variations and merge multiple
scRNA-Seq data.
}
\examples{
data('sceBatches', package = 'singleCellTK')
\dontrun{
logcounts(sceBatches) <- log1p(counts(sceBatches))
sceCorr <- runSCMerge(sceBatches)
}
}
\references{
Hoa, et al., 2020
}
