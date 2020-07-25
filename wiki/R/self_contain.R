#' @title make a text file, such as cascading style sheet, self-contained
#'
#' @description
#' as a special reminder, \code{download} is kind of tricky. Beacuse the font
#' file automatically downloaded by R can't work, you have to manually download
#' it by hand using browser. But the function is still helpful, it will generate
#' a R file with urls listed per line, then you can save at least 50% time.
#'
#' @details
#' for css file,
#' \enumerate{
#'   \item \emph{url('../fonts/glyphicons-halflings-regular.eot?#iefix')} is not allowed
#'   \item There can only be one \emph {url} per line
#' }
#'
#'
#' @param file string, path to the source file
#' @param dest string, path to the dest file, \code{NULL} means dest is same as file
#' @param root string, if url is relative path, you can specify \code{root} to make it a absolute path
#' @param download logical scalar, whether need to download the url file
#'
#' @return nothing
#' @export
#'
#' @examples
#' \donotrun {
#'     self_contain('data-raw/font.css', 'data-raw/font2.css',download = T)
#' }
self_contain <- function(file, dest = NULL, root = '', download = FALSE) {
    require(stringr);

    if (is.null(dest)) dest = file
    content <- readr::read_lines(file);

    quotes <- c('"', "'", '');
    pattern1 <- paste0('(url\\(', quotes, '[\\w\\W]*?', quotes, '\\))', collapse = '|');
    url.wrapper <- stringr::str_extract(content, pattern1)
    url.wrapper = url.wrapper[!is.na(url.wrapper)]
    pattern2 <- paste0(c(paste0('^url\\(', quotes), paste0(quotes, '\\)$')),collapse = '|')
    url <- stringr::str_replace_all(url.wrapper, pattern2, '')
    url <- stringr::str_replace_all(url, pattern2, '')

    if (download) {
        write(url, paste0(file,'.R'))
    } else {
        for (i in seq_along(url)) {
            if (file.exists(paste0(root, url[i])))
                content = str_replace(content, fixed(url[i]),
                                      paste0('data:text/css;base64,', base64enc::base64encode(paste0(root, url[i]))))
                #there may be some bugs in base64 encodeing
        }
        write(content, dest)
    }
}
