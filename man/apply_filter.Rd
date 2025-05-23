% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/imagefilter.R
\name{apply_filter}
\alias{apply_filter}
\title{Title Iterates over each pixel in a bitmap array and applies a given filter function.}
\usage{
apply_filter(bitmap, filter_func, ...)
}
\arguments{
\item{bitmap}{A 3D array representing an image.}

\item{filter_func}{A function to apply to each pixel.}

\item{...}{Additional arguments passed to the filter function.}
}
\value{
A 3D array of the same dimensions with the filtered pixel values.
}
\description{
Title Iterates over each pixel in a bitmap array and applies a given filter function.
}
