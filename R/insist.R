#' insist
#' @description Insists a object meets a given criteria
#' @param . object
#' @param test logical test, expression
#' @details Tests if the object meets the citeria. If it does, the object is returned. If not, an error is thrown. Test should be an expression that refers to the object as . 
#' @return the object 
#' @examples
#' require(magrittr)
#' pi %>% insist(. > 3) 
#' pi %>% insist(length(.) == 1)
#' @export

insist <- function(., test){
  if(!eval(substitute(test), envir = parent.frame())){
    stop(deparse(substitute(test)), " is not TRUE: \n. =  ", .)
  } 
  return(.)
}

