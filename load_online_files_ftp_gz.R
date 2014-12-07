GEO_file <- "GSE3189_series_matrix.txt"
temp <- tempfile()
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE3nnn/GSE3189/matrix/GSE3189_series_matrix.txt.gz",temp)
strs <- readLines(gzfile(temp, GEO_file))
skiplines <- 57; rowlength <- length(strs) - skiplines -2 ;
GSE3189_matrix <- read.csv(gzfile(temp, GEO_file), header=TRUE, sep="\t",skip = skiplines, nrows= rowlength)
