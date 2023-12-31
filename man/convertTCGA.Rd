% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convertTCGA.R
\name{convertTCGA}
\alias{convertTCGA}
\alias{convertPANCAN12}
\title{Convert Data from RTCGA Family to Bioconductor Classes}
\usage{
convertTCGA(dataSet, dataType = "expression")

convertPANCAN12(dataSet)
}
\arguments{
\item{dataSet}{A data.frame to be converted to \link[Biobase]{ExpressionSet} or \link[GenomicRanges]{GRanges}.}

\item{dataType}{One of \code{expression} or \code{CNV} (for \pkg{RTCGA.CNV} datasets).}
}
\value{
Functions return an \link[Biobase]{ExpressionSet} or a \link[GenomicRanges]{GRanges} for \pkg{RTCGA.CNV}
}
\description{
Functions use \pkg{Biobase} (\href{http://bioconductor.org/packages/release/bioc/html/Biobase.html}{http://bioconductor.org/packages/release/bioc/html/Biobase.html}) package to transform
data from packages from RTCGA data family to Bioconductor classes (\pkg{RTCGA.rnaseq}, \pkg{RTCGA.RPPA}, \pkg{RTCGA.PANCAN12},
\pkg{mRNA}, \pkg{RTCGA.methylation} to \link[Biobase]{ExpressionSet} and \pkg{RTCGA.CNV} to \link[GenomicRanges]{GRanges}). For \pkg{RTCGA.PANCAN12} there is sense to convert
\code{expression.cb1, expression.cb2, cnv.cb}.
}
\details{
This functionality is motivated by that we were asked to offer the data in Bioconductor-friendly classes because many users already
have their data in one of the core infrastructure classes. Data of the same type in compatible
containers promotes interoperability and makes it easy to combine and organize.

Bioconductor classes were designed to capitalize on the biological structure of the data. If
data have a range-based component it's natural, for Bioconductor users, to store and access
these as a GRanges where they can extract position, strand etc. in the same way. Similarly for
ExpressionSet. This class holds expression data along with experiment metadata and comes with
built in accessors to extract and manipulate data. The idea is to offer a common API to the
data; extracting the start position in a GRanges is always start(). With a data.frame it is
different each time (unless select() is implemented) as the column names and organization of
data can be different.

AnnotationHub and the soon to come ExperimentHub will host many different types of data. A
primary goal moving forward is to offer similar data in a consistent format. For example, CNV
data in AnnotationHub is offered as a GRanges and as more CNV are added we will ask that they
too are packaged as GRanges. The aim is that streamlined data on the back-end will make for a
more intuitive experience on the front-end.
}
\section{Biobase and GenomicRanges}{


This function use tools from the fantastic \pkg{Biobase} (and \pkg{GenomicRanges} for CNV)
package, so you'll need to make sure to have it installed.
}

\section{Issues}{


If you have any problems, issues or think that something is missing or is not
clear please post an issue on 
\href{https://github.com/RTCGA/RTCGA/issues}{https://github.com/RTCGA/RTCGA/issues}.
}

\examples{


########
########
# Expression data
########
########
library(RTCGA.rnaseq)
library(Biobase)
convertTCGA(BRCA.rnaseq) -> BRCA.rnaseq_ExpressionSet
\dontrun{
library(RTCGA.PANCAN12)
convertPANCAN12(expression.cb1) -> PANCAN12_ExpressionSet
library(RTCGA.RPPA)
convertTCGA(BRCA.RPPA) -> BRCA.RPPA_ExpressionSet
library(RTCGA.methylation)
convertTCGA(BRCA.methylation) -> BRCA.methylation_ExpressionSet
library(RTCGA.mRNA)
convertTCGA(BRCA.mRNA) -> BRCA.mRNA_ExpressionSet 
########
########
# CNV
########
########
library(RTCGA.CNV)
library(GRanges)
convertTCGA(BRCA.CNV, "CNV") -> BRCA.CNV_GRanges

}

}
\seealso{
\pkg{RTCGA} website \href{http://rtcga.github.io/RTCGA/}{http://rtcga.github.io/RTCGA/}.

Other RTCGA: 
\code{\link{RTCGA-package}},
\code{\link{boxplotTCGA}()},
\code{\link{checkTCGA}()},
\code{\link{datasetsTCGA}},
\code{\link{downloadTCGA}()},
\code{\link{expressionsTCGA}()},
\code{\link{heatmapTCGA}()},
\code{\link{infoTCGA}()},
\code{\link{installTCGA}()},
\code{\link{kmTCGA}()},
\code{\link{mutationsTCGA}()},
\code{\link{pcaTCGA}()},
\code{\link{readTCGA}()},
\code{\link{survivalTCGA}()},
\code{\link{theme_RTCGA}()}
}
\author{
Marcin Kosinski, \email{m.p.kosinski@gmail.com}
}
\concept{RTCGA}
