.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Welcome to rosyrx. By using this package you agree to the Terms of Service for the RxNorm API: http://mor.nlm.nih.gov/download/rxnav/TermOfService.html. This product uses publicly available data from the U.S. National Library of Medicine (NLM), National Institutes of Health, Department of Health and Human Services; NLM is not responsible for the product and does not endorse or recommend this or any other product.")
}

rosyrx_blank <- list(
  metadata = NULL,
  data = NULL,
  summary = NULL
)
