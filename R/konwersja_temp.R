#' Konwersja temperatury
#'
#' @description
#' Ta funkcja przelicza temperaturę wyrażoną w stopniach Fahrenheita na stopnie Celsjusza
#'
#'
#' @param temperatura_f wektor zawierajacy wartosci temperatury w stopniach Fahrenheita
#'
#' @return wektor o takiej samej długości jak @param
#' @export
#'
#' @examples
#' konwersja_temp(75)
#' konwersja_temp(110)
#' konwersja_temp(0)
#' konwersja_temp(c(0, 75, 110))
konwersja_temp = function(temperatura_f){
  (temperatura_f - 32) / 1.8
}

