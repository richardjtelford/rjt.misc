#' insist
#' @description Insists a object meets a given criteria
#' @param . object
#' @param test logical test, expression
#' @param continue if true prints error, if false throws error
#' @details Tests if the object meets the citeria. If it does, the object is returned. If not, an error is thrown unless continue is true, in which case the error is returned. Test should be an expression that refers to the object as . 
#' @return the object 
#' @examples
#' require(magrittr)
#' pi %>% insist(. > 3) 
#' pi %>% insist(length(.) == 1)
#' @export

insist <- function(., test, continue = TRUE){
  
  if(!eval(substitute(test), envir = parent.frame())){
    error <- paste0(deparse(substitute(test)), " is not TRUE: \n. =  ", .)
    if(continue){
      return(error)
    }else{
      stop(error)
    }
  } 
  return(.)
}

