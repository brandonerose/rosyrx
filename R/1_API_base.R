BASE_RXNAV <- "https://rxnav.nlm.nih.gov/"
BASE_RXNORM <- paste0(BASE_RXNAV,"REST/")
BASE_RXNORM_PRESCRIBE <- paste0(BASE_RXNORM,"Prescribe/")
BASE_RXCLASS <- paste0(BASE_RXNORM,"rxclass/")
BASE_RXTERMS <- paste0(BASE_RXNORM,"RxTerms/")

api <- function(base=BASE_RXNORM,path,query=NULL){
  result <- httr::GET(
    url = paste0(base,path,".json"),
    query = query
  )
  if(httr::http_error(result))message(httr::http_status(result)$message)
  result<-httr::content(result)
  return(result)
}
