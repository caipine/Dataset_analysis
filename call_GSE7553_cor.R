
call_GSE_7553_cor <- function(genelist){      #start
#genelist    <- c("ESRRA", "ESRRG", "MITF","SNAI2","HMG20A","ZEB2")
temp <- tempfile()
download.file("http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?mode=raw&is_datatable=true&acc=GPL96&id=15653&db=GeoDb_blob82",temp)
strs1 <- readLines(temp)
rowlength1 <- length(strs1) - 16 - 1
x1 <-   read.csv(temp, header=TRUE, sep="\t",skip = 16, nrows= rowlength1 )
x1 <-   x1[x1 $Gene.Symbol %in% genelist,]   # gene name to ID
unlink(temp)

GEO_file <- "GSE7553_series_matrix.txt"
temp1 <- tempfile()
download.file("ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE7nnn/GSE7553/matrix/GSE7553_series_matrix.txt.gz",temp)
strs1 <- readLines(gz(temp1, GEO_file))






strs <- readLines(GEO_file)
skiplines <- 84; rowlength <- length(strs) - skiplines -2 ;
y1 <- read.csv(GEO_file, header=TRUE, sep="\t",skip = skiplines, nrows= rowlength )
y1 <-  y1[y1$ID_REF %in% x1$ID,]     #call interesting gene

www<-strsplit(as.character(x1$ID), "[_]") ;i<-1
for (i in 1:15) { www[[i]] <- c(as.character(x1$Gene.Symbol[i]),www[[i]])
www[[i]]<- paste( www[[i]], collapse = ".")       
i <- i+1}       # combine gene and ID for new names
row.names(y1) <- www


             
y1 <- y1[,2:ncol(y1)]       # remove line not number
y2 <- as.data.frame(t(y1))    
g1 <- read.csv(GEO_file, header=TRUE, sep="\t",skip = 48, nrows= 12)    #call stage
g2 <- as.data.frame (t(g1[9,2: ncol(g1)]))
colnames(g2) <- "mel.stage"



g2$stage <- NULL #add new column


g2$stage[g2[,1] %in% c("normal human epidermal melanocytes", "Normal Skin" )] <- 1     #setup grade
g2$stage[g2[,1] %in% c("Basal cell carcinoma")] <- 2
g2$stage[g2[,1] %in% c("Squamous cell carcinoma")] <- 3
g2$stage[g2[,1] %in% c("Melanoma in situ","Primary Melanoma")] <- 4
g2$stage[g2[,1] %in% c("Metastatic Melanoma")] <- 5



g2$stage  <- as.numeric ( g2$stage)
y3 <- cbind(y2,g2$stage)
colnames(y3) <- c(colnames(y2),".stage")
y3 <- y3[ order(colnames(y3)) ] #order by gene name

cor(y3)



}  # end
                 
