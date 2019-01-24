library(digest)

old.file <- readRDS('version control.rds')

file <- c('engine1/style.css', 'engine1/script.js', 'wowslider.html')
new.file <- lapply(file, function(val) {suppressWarnings(sha1(readLines(val)))})
names(new.file) <- file
saveRDS(new.file, 'version control.rds')

all.equal(old.file, new.file)
