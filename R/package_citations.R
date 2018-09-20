#'package_citations
#' @description Append package citations to copy of main bibliography
#' @param packages vector of packages for which citations are required
#' @param old_bib old bibtex file to copy
#' @param new_bib new bibtex file
#' @export

package_citations <- function(packages, old_bib, new_bib){
  
  #copy original bib file
  fs::file_copy(old_bib, new_bib, overwrite = TRUE)
  
  #R citation
  Rcite <- citation()
  Rcite$key = "R"
  bibtex::write.bib(Rcite, new_bib, append = TRUE)
  
  #package citation
  bibtex::write.bib(packages, new_bib, append = TRUE)
}  
  