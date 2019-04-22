#helper functions

#' Turn floating in latex off
#' @description Forces latex to position figures in exact place rather than floating to "optimal" position 
#' @param tex character; tex path and filename to read
#' @param clean boolean; clean up intermediate files?
#' @importFrom english as.english
#' @importFrom stringi stri_opts_brkiter
#' @export

float_tex <- function(tex, clean = TRUE) {
  x <- readLines(tex)
  pos <- grep('begin\\{figure\\}\\[htbp\\]', x)
  x[pos] <- gsub('htbp', 'H', x[pos])
  writeLines(x, tex)
}

#' Numbers to text
#' @description wrapper for english::as.english that forces character output
#' @param x integer to convert to English
#' @importFrom english as.english
#' @export

as.english <- function(x){ # problem with new version of rmarkdown
  as.character(as.english(x))
}

#' @describeIn as.english wrapper for english::as.english that forces character output in sentence case
#' @importFrom english as.english
#' @importFrom stringi stri_opts_brkiter
#' @export
as.English <- function(x){ #sentence case
  stringi::stri_trans_totitle(
    as.character(as.english(x)), 
    opts_brkiter = stri_opts_brkiter(type = "sentence"))
}

#' Format p value
#' @description Formats p value to 2 significant figures or < 0.001 
#' @param p real number to format
#' @export
format_p <- function(p) {
  ifelse(p < 0.001, "< 0.001", paste("=", signif(p, 2)))
}

