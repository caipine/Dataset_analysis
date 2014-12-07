temp <- tempfile()
download.file("http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?mode=raw&is_datatable=true&acc=GPL96&id=15653&db=GeoDb_blob82",temp)
strs1 <- readLines(temp)
rowlength1 <- length(strs1) - 16 - 1
GPL96 <-   read.csv(temp, header=TRUE, sep="\t",skip = 16, nrows= rowlength1 )
unlink(temp)
head(GPL96)
