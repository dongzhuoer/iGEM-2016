#' @title extract igem teams' url of a given year
#'
#' @param year integer scalar
#'
#' @return character vector, extracted urls
#' @export
#'
#' @examples
#' \dontrun{
#'     extract_url(2017)
#' }
#'
#' @importFrom magrittr %>%
extract_url <- function(year) {
    html <- xml2::read_html(paste0('http://igem.org/Team_Wikis?year=', year))
    url <- html %>% rvest::html_nodes("a") %>% rvest::html_attr("href")
    url = url[stringr::str_detect(url, stringr::fixed('.igem.org/Team:'))]
    url = url[!is.na(url)]
    url = paste0('"', url, '"');
}

#' @title generate `copy.htm`
#'
#' @description navigate wiki pages of all iGEM teams
#'
#' @param years integer vector
#'
#' @return NULL
#' @export
#'
#' @examples
#' \donotrun{
#'     make_copy(2013:2017)
#' }
make_copy <- function(years) {
    #
    copy <- readr:::read_lines('copy.htm');

    #
    urls <- character(length(years));

    for (i in seq_along(years)) {
        url <- extract_url(years[i]);
        urls[i] = paste0(url, collapse = ',');
    }

    urls = paste0('[', urls, ']', collapse = ',');

    urls_line <- which(stringr::str_detect(copy, 'var urls'));
    copy[urls_line] = paste0('\t\tvar urls=[', urls, '];');

    #
    readr::write_lines(copy, 'copy.htm');
    NULL;
}
