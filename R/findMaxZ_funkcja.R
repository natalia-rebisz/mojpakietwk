#' Znajdź najwyższe drzewo na podstawie znormalizowanej chmury punktów
#'
#' @param dirPath ścieżka do katalogu z plikiem/plikami .las
#' @param hgtTresh próg wysokości, powyżej którego zapisywane mają być najwyższe drzewa
#'
#' @return plik ESRI Shapefile o punktowej geometrii, lokalizujący najwyższe drzewo
#' @export
#'
#' @examples
findMaxZ = function(dirPath, hgtTresh) {
  lasList = list.files(path = paste0(getwd(), dirPath), pattern = ".laz$", full.names = T)

  for (i in 1:length(lasList)) {
    tempLas = lidR::readLAS(lasList[1], filter = "-drop_z_below 0 -keep_class 2 3 4 5")
    tempDf = as.data.frame(tempLas@data)
    najwyzszeDrzewo = tempDf[which.max(tempDf$Z), ]
    najwyzszeDrzewo = najwyzszeDrzewo[, c(1:3, 5:7, 10,14)]
    if (najwyzszeDrzewo$Z > hgtTresh) {
      name = paste(basename(lasList[i]),".shp", sep = "")
      sf::st_write(sf::st_as_sf(najwyzszeDrzewo, coords = c("X","Y"), crs = 2180), paste0(dirPath, name))
    } else {
      cat(i, lasList[i], "nie posiadal punktow powyzej", hgtTresh, "m\n")
    }
  }
}
