temp <- tempfile()
download.file("http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?mode=raw&is_datatable=true&acc=GPL96&id=15653&db=GeoDb_blob82",temp)
strs1 <- readLines(temp)
rowlength1 <- length(strs1) - 16 - 1
GPL96 <-   read.csv(temp, header=TRUE, sep="\t",skip = 16, nrows= rowlength1 )
unlink(temp)
head(GPL96)


GEO_file <- "GSE7553_series_matrix.txt"
temp <- tempfile()
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE7nnn/GSE7553/matrix/GSE7553_series_matrix.txt.gz",temp)
strs <- readLines(gzfile(temp, GEO_file))
skiplines <- 84; rowlength <- length(strs) - skiplines -2 ;
GSE7553_matrix <- read.csv(gzfile(temp, GEO_file), header=TRUE, sep="\t",skip = skiplines, nrows= rowlength)


g1 <- read.csv(gzfile(temp, GEO_file), header=TRUE, sep="\t",skip = 48, nrows= 12)    #call stage

unlink(temp)
head(GSE7553_matrix)

