
call_GSE7553_cor <- function(genelist){      #start

#genelist    <- c("ESRRA", "ESRRG", "MITF","SNAI2","HMG20A","ZEB2")
x1 <-   GPL96[GPL96$Gene.Symbol %in% genelist,]   # gene name to ID
x2 <-strsplit(as.character(x1$ID), "[_]") ;
i<-1
for (i in 1:length(x2)) { x2[[i]] <- c(as.character(x1$Gene.Symbol[i]),x2[[i]])
x2[[i]]<- paste(x2[[i]], collapse = ".")       
i <- i+1
}
x2  # x2 is new gene and ID combination


y1 <-  GSE7553_matrix[GSE7553_matrix$ID_REF %in% x1$ID,]     #call interesting gene
head(y1)
y2 <- y1[,2:ncol(y1)]; #remove line not number
y2 <- as.data.frame(t(y2))  
colnames(y2) <- x2    #new colnames
head(y2)




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
                 
