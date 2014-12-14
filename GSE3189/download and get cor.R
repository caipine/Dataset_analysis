
temp <- tempfile()
download.file("http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?mode=raw&is_datatable=true&acc=GPL96&id=15653&db=GeoDb_blob82",temp)
strs1 <- readLines(temp)
rowlength1 <- length(strs1) - 16 - 1
GPL96 <-   read.csv(temp, header=TRUE, sep="\t",skip = 16, nrows= rowlength1 )
unlink(temp)
head(GPL96)


GEO_file <- "GSE3189_series_matrix.txt"
temp <- tempfile()
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE3nnn/GSE3189/matrix/GSE3189_series_matrix.txt.gz",temp)
strs <- readLines(gzfile(temp, GEO_file))
skiplines <- 57; rowlength <- length(strs) - skiplines -2 ;
GSE3189_matrix <- read.csv(gzfile(temp, GEO_file), header=TRUE, sep="\t",skip = skiplines, nrows= rowlength)
g1 <- read.csv(gzfile(temp, GEO_file), header=TRUE, sep="\t",skip = 26, nrows= 10)    #call stage
unlink(temp)
head(GSE3189_matrix)





genelist    <- "MITF"
ID_REF_list <- GPL96[GPL96$Gene.Symbol %in% genelist,]$ID   # gene name to ID
ID_REF_list
ID_REF_list[1]

paste(genelist, REF_ID[1], collapse = " ")





Sys.time()
my_frame <- GSE3189_matrix
main_gene_num <- as.numeric (rownames(my_frame[my_frame$ID_REF %in% ID_REF_list[1],] ))
my_frame[main_gene_num, 1]

#main_gene_num=17758;     # G6PD 1809       PGLS 17758 17759 30679

my_frame[main_gene_num,1]
frame_B <-read.table(file="2.txt", header=TRUE, sep="\t")
colnames(frame_B) <- c("NA", as.character(my_frame[main_gene_num,1]))
frame_B
nrow(my_frame)

for (i in c(1:nrow(my_frame))) {

#for (i in c(1:1000)) {
#i=15
my_frame_main_gene <- my_frame[main_gene_num,]
my_frame_gene_i <- my_frame[i:(i+1),]
my_frame_main_gene_and_gene_i <- rbind(my_frame_main_gene,my_frame_gene_i)
#my_frame_main_gene_and_gene_i
#dim ( my_frame_main_gene_and_gene_i)
#ncol( my_frame_main_gene_and_gene_i)

my_frame_Y <-(t(my_frame_main_gene_and_gene_i)[2:ncol(my_frame_main_gene_and_gene_i),])
my_frame_Y1 <- cbind(as.numeric(my_frame_Y[,1]),as.numeric(my_frame_Y[,2]))
my_frame_Y2 <- data.frame( my_frame_Y1)
my_correlation_a <- data.frame (cor(my_frame_Y2 [,1:ncol(my_frame_Y2)], method="pearson")) [1,]
rownames(my_correlation_a) <- c(as.character(my_frame_gene_i[1,1]))
#my_correlation_a

colnames(my_correlation_a) <- colnames(frame_B)
frame_B <- rbind(frame_B, my_correlation_a)

}
#frame_B
frame_C <-data.frame(frame_B[,2])
colnames(frame_C) <- c(as.character(my_frame[main_gene_num,1]))
rownames(frame_C) <- rownames(frame_B)
#frame_C
Data <- frame_C[-(1),,drop=FALSE]  # still a data.frame
#Data
write.table(Data, file="correlation_MITF_207233_s_at.txt", sep="\t", col.names = NA)

Sys.time()
