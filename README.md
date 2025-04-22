imagefilter is a R package  that applies grayscale and binary color cutoff filters to RGB images.

# Installation
To install the imagefilter package from GitHub, you will need to use the devtools package:

install.packages("devtools")

devtools::install_github("ryuheum/imagefilter")

# Required Dependency
The package relies on the magick package for image loading and visualization.

install.packages("magick")

# Usage
The full usage example, including image loading, filtering, and visualization, is already included in the R/imagefilter.R script.
Simply run the script to see the filters applied to the sample image (Test.jpeg). The script will automatically load the image, apply the grayscale and binary color cutoff filters, and display the resulting images.

Run package by

(1) open the script in R studio and click "Run"

(2) Run directly from R console by using source()function

source ("path/to/imagefilter.R")
