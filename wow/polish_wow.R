library(stringr)
library(base64enc)

suppressWarnings(css <- readLines('W:/iGEM/wowslider/Team/engine1/style.css'))

css <- stringr::str_replace(css, './bullet.png',
                            paste0('data:image/png;base64,',
                                   base64enc::base64encode('W:/iGEM/wowslider/Team/engine1/bullet.png')))

css <- stringr::str_replace(css, './arrows.png',
                            paste0('data:image/png;base64,',
                                   base64enc::base64encode('W:/iGEM/wowslider/Team/engine1/arrows.png')))

css <- stringr::str_replace(css, './arrows.gif',
                            paste0('data:image/gif;base64,',
                                   base64enc::base64encode('W:/iGEM/wowslider/Team/engine1/arrows.gif')))


writeLines(css, 'W:/iGEM/wiki/css/style.css')

file.copy('W:/iGEM/wowslider/Team/engine1/script.js', 'W:/iGEM/wiki/js/script.js', overwrite = T)
