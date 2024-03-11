# RXNORM ------------------

## Metadata
get_rxn_getIdTypes <- function(){api(path = "idtypes")$idTypeList$idName%>% as.character()}
get_rxn_getPropCategories <- function(){api(path = "propCategories")$propCategoryList$propCategory %>% as.character()}
get_rxn_getPropNames <- function(){api(path = "propnames")$propNameList$propName%>% as.character()}
get_rxn_getRxNormVersion <- function(){
  x<-api(path = "version") %>% as.character()
  paste0(x[2]," (",x[1],")")
}
get_rxn_getSourceTypes <- function(){api(path = "sourcetypes")$sourceTypeList$sourceName %>% as.character()}
get_rxn_getTermTypes <- function(){api(path = "termtypes")$termTypeList$termType %>% as.character()}
get_rxn_getRelaTypes <- function(){api(path = "relatypes")$relationTypeList$relationType %>% as.character()}

## Data
get_rxn_getDisplayTerms <- function(){api(path = "displaynames")$displayTermsList$term %>% as.character()}
get_rxn_getAllConceptsByTTY <- function(query = list(tty="ALL")){api(path = "allconcepts",query=query)$minConceptGroup$minConcept %>% dplyr::bind_rows()}
get_rxn_getAllProperties <- function(rxcui,query = list(prop="ALL")){api(path = paste0('rxcui/',rxcui,'/allProperties'),query=query)$propConceptGroup$propConcept %>% dplyr::bind_rows()}
get_rxn_getAllRelatedInfo <- function(rxcui,query = NULL){
  data.frame(
    from = rxcui,
    to = api(path = paste0('rxcui/',rxcui,'/allrelated'),query=query)$allRelatedGroup$conceptGroup %>% lapply(function(E){E[["conceptProperties"]]}) %>% dplyr::bind_rows() %>% dplyr::pull("rxcui") %>% unique()
  )
}

## Other

get_rxn_getMultiIngredBrand <- function(){'/brands'}
get_rxn_filterByProperty <- function(){'/rxcui/rxcui/filter'}
get_rxn_findRelatedNDCs <- function(){'/relatedndc'}
get_rxn_findRxcuiById <- function(){'/rxcui?idtype=...&id=...'}
get_rxn_findRxcuiByString <- function(){'/rxcui?name=...'}
get_rxn_getAllConceptsByStatus <- function(){'/allstatus'}

get_rxn_getAllHistoricalNDCs <- function(){'/rxcui/rxcui/allhistoricalndcs'}
get_rxn_getAllNDCsByStatus <- function(){'/allNDCstatus'}
get_rxn_getApproximateMatch <- function(){'/approximateTerm'}
get_rxn_getDrugs <- function(){'/drugs'}

get_rxn_getNDCProperties <- function(){'/ndcproperties'}
get_rxn_getNDCStatus <- function(){'/ndcstatus'}
get_rxn_getNDCs <- function(){'/rxcui/rxcui/ndcs'}

get_rxn_getProprietaryInformation <- function(){'/rxcui/rxcui/proprietary'}
get_rxn_getReformulationConcepts <- function(){'/reformulationConcepts'}
get_rxn_getRelatedByRelationship <- function(){'/rxcui/rxcui/related?rela=...'}
get_rxn_getRelatedByType <- function(){'/rxcui/rxcui/related?tty=...'}
get_rxn_getRxConceptProperties <- function(){'/rxcui/rxcui/properties'}
get_rxn_getRxNormName <- function(){'/rxcui/rxcui'}

get_rxn_getRxProperty <- function(){'/rxcui/rxcui/property'}
get_rxn_getRxcuiHistoryStatus <- function(){'/rxcui/rxcui/historystatus'}

get_rxn_getSpellingSuggestions <- function(){'/spellingsuggestions'}

# RXNORM PRESCRIBE ---------------------

## Metadata

get_rxp_getIdTypes <- function(){api(base = BASE_RXNORM_PRESCRIBE,path = "idtypes")$idTypeList$idName%>% as.character()}
get_rxp_getPropCategories <- function(){api(base = BASE_RXNORM_PRESCRIBE,path = "propCategories")$propCategoryList$propCategory %>% as.character()}
get_rxp_getPropNames <- function(){api(base = BASE_RXNORM_PRESCRIBE,path = "propnames")$propNameList$propName%>% as.character()}
get_rxp_getSourceTypes <- function(){api(base = BASE_RXNORM_PRESCRIBE,path = "sourcetypes")$sourceTypeList$sourceName %>% as.character()}
get_rxp_getTermTypes <- function(){api(base = BASE_RXNORM_PRESCRIBE,path = "termtypes")$termTypeList$termType %>% as.character()}
get_rxp_getRelaTypes <- function(){api(base = BASE_RXNORM_PRESCRIBE,path = "relatypes")$relationTypeList$relationType %>% as.character()}

## Data
get_rxp_getDisplayTerms <- function(){api(base = BASE_RXNORM_PRESCRIBE,path = "displaynames")$displayTermsList$term %>% as.character()}

get_rxp_getAllConceptsByTTY <- function(query = list(tty="ALL")){api(base = BASE_RXNORM_PRESCRIBE,path = "allconcepts",query=query)$minConceptGroup$minConcept %>% dplyr::bind_rows()}

## Other

get_rxp_filterByProperty <- function(){'/rxcui/rxcui/filter'}
get_rxp_findRxcuiById <- function(){'/rxcui?idtype=...&id=...'}
get_rxp_findRxcuiByString <- function(){'/rxcui?name=...'}
get_rxp_getAllProperties <- function(){'/rxcui/rxcui/allProperties'}
get_rxp_getAllRelatedInfo <- function(){'/rxcui/rxcui/allrelated'}
get_rxp_getApproximateMatch <- function(){'/approximateTerm'}

get_rxp_getDrugs <- function(){'/drugs'}

get_rxp_getMultiIngredBrand <- function(){'/brands'}
get_rxp_getNDCs <- function(){'/rxcui/rxcui/ndcs'}

get_rxp_getRelatedByRelationship <- function(){'/rxcui/rxcui/related?rela=...'}
get_rxp_getRelatedByType <- function(){'/rxcui/rxcui/related?tty=...'}
get_rxp_getRxConceptProperties <- function(){'/rxcui/rxcui/properties'}
get_rxp_getRxNormName <- function(){'/rxcui/rxcui'}
get_rxp_getRxProperty <- function(){'/rxcui/rxcui/property'}

get_rxp_getSpellingSuggestions <- function(){'/spellingsuggestions'}
# RXTERMS ---------------------

## Metadata
get_rxt_getRxTermsVersion <- function(){api(base=BASE_RXTERMS,path = "version")$rxtermsVersion %>% as.character()}
## Data
get_rxt_getAllConcepts <- function(){api(base=BASE_RXTERMS,path = "allconcepts")$minConceptGroup$minConcept %>% dplyr::bind_rows()}
## Other

get_rxt_getAllRxTermInfo <- function(){'/rxcui/rxcui/allinfo'}
get_rxt_getRxTermDisplayName <- function(){'/rxcui/rxcui/name'}

# RXCLASS -----------------

## Metadata

get_rxc_getClassTypes <- function(){api(base=BASE_RXCLASS,path = "classTypes")$classTypeList$classTypeName %>% as.character()}

## Data
get_rxc_getAllClasses <- function(){api(base=BASE_RXCLASS,path = "allClasses")$rxclassMinConceptList$rxclassMinConcept %>% dplyr::bind_rows()}


## Other
get_rxc_getRelas <- function(){api(base=BASE_RXCLASS,path = "relas")$relaList$rela %>% as.character()}

get_rxc_findClassByName <- function(){'/class/byName'}
get_rxc_findClassesById <- function(){'/class/byId'}
get_rxc_findSimilarClassesByClass <- function(){'/class/similar'}
get_rxc_findSimilarClassesByDrugList <- function(){'/class/similarByRxcuis'}
get_rxc_getClassByRxNormDrugId <- function(){'/class/byRxcui'}
get_rxc_getClassByRxNormDrugName <- function(){'/class/byDrugName'}
get_rxc_getClassContexts <- function(){'/classContext'}
get_rxc_getClassGraphBySource <- function(){'/classGraph'}
get_rxc_getClassMembers <- function(){'/classMembers'}
get_rxc_getClassTree <- function(){'/classTree'}
get_rxc_getRelaSourceVersion <- function(){'/version/relaSource'}

get_rxc_getSimilarityInformation <- function(){'/class/similarInfo'}
get_rxc_getSourcesOfDrugClassRelations <- function(){'/relaSources'}

# Generic parser function for various response types.
parse_results <- function(result) {
  if(status_code(result) != 200){
    NULL
  } else {
    resContent <- content(result)
    resContent
  }
}
