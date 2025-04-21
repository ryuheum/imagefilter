#install packages
if (!require("magick")) {
  install.packages("magick")
}
library(magick)

# Load image from URL
image_path <- "https://raw.githubusercontent.com/ryuheum/group-assignment/main/image/Test.jpeg" #Change to location of your jpeg file
my_image <- image_read(image_path)

# Convert to bitmap
my_bitmap <- as.integer(my_image[[1]])

# Display original image
plot(my_image)

#' Title Convert a pixel to greyscale
#'
#' @param pixel A numeric vector of length 3 representing an RGB pixel.
#'
#' @return A numeric vector of length 3 with identical greyscale values.
#' @export
#  Convert a pixel to greyscale
greyscale_filter <- function(pixel) {
  R <- pixel[1]
  G <- pixel[2]
  B <- pixel[3]
  grey_value <- R * 0.299 + G * 0.587 + B * 0.114
  grey_value <- max(0, min(255, grey_value))
  return(rep(grey_value, 3))
}

#' Title Apply a greyscale-based cutoff to convert pixel color
#'
#' @param pixel A numeric vector of length 3 representing an RGB pixel.
#' @param cutoff A numeric value between 0 and 255. Defaults to 128.
#'
#' @return A numeric vector of length 3 representing the filtered RGB pixel.
#' @export
# Function for color cut-off with specific colors
color_cutoff_filter <- function(pixel, cutoff = 128) {
  grey_value <- greyscale_filter(pixel)[1]
  if (grey_value < cutoff) {
    return(c(255, 0, 255))
  } else {
    return(c(0, 0, 0))
  }
}


#' Title Iterates over each pixel in a bitmap array and applies a given filter function.
#'
#' @param bitmap A 3D array representing an image.
#' @param filter_func A function to apply to each pixel.
#' @param ... Additional arguments passed to the filter function.
#'
#' @return A 3D array of the same dimensions with the filtered pixel values.
#' @export
# Function to apply filter to bitmap
apply_filter <- function(bitmap, filter_func, ...) {
  dims <- dim(bitmap)
  for (i in 1:dims[1]) {
    for (j in 1:dims[2]) {
      bitmap[i, j, ] <- filter_func(bitmap[i, j, ], ...)
    }
  }
  return(bitmap)
}

# Apply greyscale filter and display the image
greyscale_bitmap <- apply_filter(my_bitmap, greyscale_filter)
greyscale_image <- image_read(as.raster(greyscale_bitmap / 255))
plot(greyscale_image)
image_browse(greyscale_image)
# Apply color cut-off filter and display the image
cutoff_bitmap <- apply_filter(my_bitmap, color_cutoff_filter)
cutoff_image <- image_read(as.raster(cutoff_bitmap / 255))
plot(cutoff_image)
image_browse(cutoff_image)



