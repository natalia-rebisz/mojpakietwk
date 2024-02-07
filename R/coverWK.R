#' Oblicz zwarcie poziome koron drzew
#'
#' @param Z wektor zawierający wysokości znormalizowanej chmury punktów
#' @param RN wektor zawierający numer odbicia (echa) punktu
#' @param hgtbreak próg wysokości powyżej którego ma być liczone zwarcie
#' @param las_path ścieżka do znormalizowanej chmury punktów
#'
#' @return wartość zwarcia poziomego koron drzew
#' @export
#'
#' @examples
#' laspath = "D:/Wojtek/Geomatyka/dane_mce/dzialka_lidar/2023.laz"
#' Z = as.name("Z")
#' RN = as.name("ReturnNumber")
#' canopyCover(laspath, Z, RN, 2)

canopyCover = function(las_path, Z, RN, hgtbreak) {
  lidR::readLAS(las_path)
  above_hgtbreak = length(which(RN == 1 & Z >= hgtbreak))
  firstReturns = length(which(RN == 1))
  cover = above_hgtbreak/firstReturns
  return(cover)
}
