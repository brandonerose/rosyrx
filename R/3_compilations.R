update_rosyrx_metadata <- function(rosyrx){
  rosyrx$metadata <- list(
    version = get_rxn_getRxNormVersion(),
    termsVersion = get_rxt_getRxTermsVersion,
    idNames = get_rxn_getIdTypes(),
    propNames = get_rxn_getPropNames(),
    propCategories = get_rxn_getPropCategories(),
    sourceNames = get_rxn_getSourceTypes(),
    termTypes = get_rxn_getTermTypes(),
    relationTypes = get_rxn_getRelaTypes(),
    relas = get_rxc_getRelas(),
    classTypes = get_rxc_getClassTypes(),
    classes = get_rxc_getAllClasses()
  )
  return(rosyrx)
}
update_rosyrx_data <- function(rosyrx){
  rosyrx$data <- list(
    displayTerms = get_rxn_getDisplayTerms(),
    rxn_concepts = get_rxn_getAllConceptsByTTY(),
    rxt_concepts = get_rxt_getAllConcepts(),
    rxc_concepts = get_rxc_getAllClasses()
  )
  rxp_allconcepts <- get_rxp_getAllConceptsByTTY()
  rosyrx$data$rxn_concepts$prescribable <- rosyrx$data$rxn_concepts$rxcui%in%rxp_allconcepts$rxcui
  for(TTY in c("IN","BN")){
    rxp_prop <- NULL
    Ns<-rosyrx$data$rxn_concepts$rxcui[which(rosyrx$data$rxn_concepts$tty==TTY)]
    pb <- progress::progress_bar$new(total = length(Ns))
    for (N in Ns){
      x<- get_rxn_getAllProperties(N)
      x$rxcui <- N
      rxp_prop <- rxp_prop %>% dplyr::bind_rows(x)
      pb$tick()
    }
    rosyrx$data[[paste0("rxp_",TTY,"_prop")]]<- rxp_prop
  }
  Ns<-rosyrx$data$rxn_concepts$rxcui[which(rosyrx$data$rxn_concepts$tty%in%c("IN","MIN","BN"))]
  pb <- progress::progress_bar$new(total = length(Ns))
  rxn_connections <- NULL
  for(N in Ns){
    rxn_connections <- rxn_connections %>% dplyr::bind_rows(get_rxn_getAllRelatedInfo(N))
    pb$tick()
  }
  rosyrx$data[["rxn_connections"]] <-rxn_connections[which(rxn_connections$from != rxn_connections$to),]
  return(rosyrx)
}
#' @export
show_rosyrx<-function(rosyrx){
  rosyrx$metadata %>% RosyUtils::add_list_to_global()
  rosyrx$data %>% RosyUtils::add_list_to_global()
}
