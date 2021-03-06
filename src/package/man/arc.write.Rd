% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/arc.write.R
\name{arc.write}
\alias{arc.write}
\title{Write dataset, table or layer}
\usage{
arc.write(path, data, coords = NULL, shape_info = NULL)
}
\arguments{
\item{path}{full output path}

\item{data}{input data frame. Accepts \code{data.frame}, spatial \code{data.frame},
\code{SpatialPointsDataFrame}, \code{SpatialLinesDataFrame}, and
\code{SpatialPolygonsDataFrame} objects.}

\item{coords}{list containing geometry type and spatial reference (optional)}

\item{shape_info}{(optional)}
}
\description{
Export a \code{data.frame} object to an ArcGIS dataset. If the data frame
includes a spatial attribute, this function writes a feature dataset. If no
spatial attribute is found, a table is instead written.
}
\details{
Supports a variety of output formats. Below are pairs of example paths and the resulting data types:
 \itemize{
  \item \code{C:/place.gdb/fc}: File Geodatabase Feature Class
  \item \code{C:/place.gdb/fdataset/fc}: File Geodatabase Feature Dataset
  \item \code{in_memory\\logreg}: In-memory workspace (must be run in ArcGIS Session)
  \item \code{C:/place.shp}: Esri Shapefile
  \item \code{C:/place.dbf}: Table
}
}
\section{References}{

\itemize{
\item \href{http://support.esri.com/es/knowledgebase/techarticles/detail/40057}{What is the difference between a shapefile and a layer file?}
\item \href{https://desktop.arcgis.com/en/desktop/latest/map/working-with-layers/what-is-a-layer-.htm}{ArcGIS Help: What is a layer?}
}
}
\examples{
## write as a shapefile
fc <- arc.open(system.file("extdata", "ca_ozone_pts.shp",
                           package="arcgisbinding"))
d <- arc.select(fc, 'ozone')
d[1,] <- 0.6
arc.write(tempfile("ca_new", fileext=".shp"), d)
## write as table
arc.write(tempfile("tlb", fileext=".dbf"),
          list('f1'=c(23,45), 'f2'=c('hello', 'bob')))

## from scratch as feature class
arc.write(tempfile("fc_pts", fileext=".shp"), list('data'=rnorm(100)),
          list(x=runif(100,min=0,max=10),y=runif(100,min=0,max=10)),
          list(type='Point'))
}
\seealso{
\code{\link{arc.dataset-class}}, \code{\link{arc.open}}
}
\keyword{datasets}
\keyword{open}
\keyword{write}

