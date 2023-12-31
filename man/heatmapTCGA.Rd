% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/heatmapTCGA.R
\name{heatmapTCGA}
\alias{heatmapTCGA}
\title{Create Heatmaps for TCGA Datasets}
\usage{
heatmapTCGA(
  data,
  x,
  y,
  fill,
  legend.title = "Expression",
  legend = "right",
  title = "Heatmap of expression",
  facet.names = NULL,
  tile.size = 0.1,
  tile.color = "white",
  ...
)
}
\arguments{
\item{data}{A data.frame from TCGA study containing variables to be plotted.}

\item{x, y}{A character name of variable containing groups.}

\item{fill}{A character names of fill variable.}

\item{legend.title}{A character with legend's title.}

\item{legend}{A character specifying legend position. Allowed values are one of
c("top", "bottom", "left", "right", "none"). Default is "top" side position.
to remove the legend use legend = "none".}

\item{title}{A character with plot title.}

\item{facet.names}{A character of length maximum 2 containing names of variables to produce facets. See examples.}

\item{tile.size, tile.color}{A size and color passed to \link{geom_tile}.}

\item{...}{Further arguments passed to \link{geom_tile}.}
}
\description{
Function creates heatmaps (\link{geom_tile}) for TCGA Datasets.
}
\note{
\code{heatmapTCGA} uses \link{scale_fill_viridis} from \pkg{viridis} package which is a port of the new 
\code{matplotlib} color maps (\pkg{viridis} - the default -, \code{magma}, \code{plasma} and \code{inferno}) to \code{R}.
\code{matplotlib} \href{https://matplotlib.org/}{https://matplotlib.org/} is a popular plotting library for \code{python}.
 These color maps are designed in such a way that they will analytically be perfectly perceptually-uniform, 
 both in regular form and also when converted to black-and-white. 
 They are also designed to be perceived by readers with the most common form of color blindness.
}
\section{Issues}{


If you have any problems, issues or think that something is missing or is not
clear please post an issue on 
\href{https://github.com/RTCGA/RTCGA/issues}{https://github.com/RTCGA/RTCGA/issues}.
}

\examples{
 
 
library(RTCGA.rnaseq)
# perfrom plot
library(dplyr)


expressionsTCGA(ACC.rnaseq, BLCA.rnaseq, BRCA.rnaseq, OV.rnaseq,
                extract.cols = c("MET|4233", "ZNF500|26048", "ZNF501|115560")) \%>\%
  rename(cohort = dataset,
         MET = `MET|4233`) \%>\%
  #cancer samples
  filter(substr(bcr_patient_barcode, 14, 15) == "01") \%>\%
  mutate(MET = cut(MET,
   round(quantile(MET, probs = seq(0,1,0.25)), -2),
   include.lowest = TRUE,
   dig.lab = 5)) -> ACC_BLCA_BRCA_OV.rnaseq

ACC_BLCA_BRCA_OV.rnaseq \%>\%
  select(-bcr_patient_barcode) \%>\%
  group_by(cohort, MET) \%>\%
  summarise_each(funs(median)) \%>\%
  mutate(ZNF500 = round(`ZNF500|26048`),
         ZNF501 = round(`ZNF501|115560`)) -> ACC_BLCA_BRCA_OV.rnaseq.medians
heatmapTCGA(ACC_BLCA_BRCA_OV.rnaseq.medians,
  "cohort", "MET", "ZNF500", title = "Heatmap of ZNF500 expression")

## facet example
library(RTCGA.mutations)
library(dplyr)
mutationsTCGA(BRCA.mutations, OV.mutations, ACC.mutations, BLCA.mutations) \%>\%
  filter(Hugo_Symbol == 'TP53') \%>\%
  filter(substr(bcr_patient_barcode, 14, 15) == "01") \%>\% # cancer tissue
  mutate(bcr_patient_barcode = substr(bcr_patient_barcode, 1, 12)) ->
   ACC_BLCA_BRCA_OV.mutations

mutationsTCGA(BRCA.mutations, OV.mutations, ACC.mutations, BLCA.mutations) ->
  ACC_BLCA_BRCA_OV.mutations_all

ACC_BLCA_BRCA_OV.rnaseq \%>\%
  mutate(bcr_patient_barcode = substr(bcr_patient_barcode, 1, 15)) \%>\%
  filter(bcr_patient_barcode \%in\%
  substr(ACC_BLCA_BRCA_OV.mutations_all$bcr_patient_barcode, 1, 15)) \%>\% 
  # took patients for which we had any mutation information
  # so avoided patients without any information about mutations
  mutate(bcr_patient_barcode = substr(bcr_patient_barcode, 1, 12)) \%>\%
  # strin_length(ACC_BLCA_BRCA_OV.mutations$bcr_patient_barcode) == 12
  left_join(ACC_BLCA_BRCA_OV.mutations,
  by = "bcr_patient_barcode") \%>\% #joined only with tumor patients
  mutate(TP53 = ifelse(!is.na(Variant_Classification), "Mut", "WILD")) \%>\%
  select(-bcr_patient_barcode, -Variant_Classification, -dataset, -Hugo_Symbol) \%>\% 
  group_by(cohort, MET, TP53) \%>\% 
  summarise_each(funs(median)) \%>\% 
  mutate(ZNF501 = round(`ZNF501|115560`)) -> 
  ACC_BLCA_BRCA_OV.rnaseq_TP53mutations_ZNF501medians

heatmapTCGA(ACC_BLCA_BRCA_OV.rnaseq_TP53mutations_ZNF501medians, "cohort", "MET",
            fill = "ZNF501", facet.names = "TP53", 
            title = "Heatmap of ZNF501 expression")
heatmapTCGA(ACC_BLCA_BRCA_OV.rnaseq_TP53mutations_ZNF501medians, "TP53", "MET",
            fill = "ZNF501", facet.names = "cohort",
            title = "Heatmap of ZNF501 expression")
heatmapTCGA(ACC_BLCA_BRCA_OV.rnaseq_TP53mutations_ZNF501medians, "TP53", "cohort",
            fill = "ZNF501", facet.names = "MET",
            title = "Heatmap of ZNF501 expression")
}
\seealso{
\pkg{RTCGA} website \href{http://rtcga.github.io/RTCGA/articles/Visualizations.html}{http://rtcga.github.io/RTCGA/articles/Visualizations.html}.

Other RTCGA: 
\code{\link{RTCGA-package}},
\code{\link{boxplotTCGA}()},
\code{\link{checkTCGA}()},
\code{\link{convertTCGA}()},
\code{\link{datasetsTCGA}},
\code{\link{downloadTCGA}()},
\code{\link{expressionsTCGA}()},
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
