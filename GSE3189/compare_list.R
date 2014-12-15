ESRRA <-read.table(file="correlation_ESRRA_1487_at.txt", header=TRUE, sep="\t")
MITF <-read.table(file="correlation_MITF_207233_s_at.txt", header=TRUE, sep="\t")
stage <-read.table(file="correlation_with_others___stage.txt", header=TRUE, sep="\t")

MITF_50 <- MITF[MITF[,2] >= 0.5,][,1]
ESRRA_50 <- ESRRA[ESRRA[,2] >= 0.5,][,1]
stage_50 <- stage[stage[,2] >= 0.5,][,1]
ID_REF_com <- intersect (intersect(MITF_50, ESRRA_50), stage_50)
commonlist<- GPL96[GPL96$ID %in% ID_REF_com,]$Gene.Symbol
write.table(commonlist, file="commonlist.txt", sep="\t", col.names = NA)


MITF_30 <- MITF[MITF[,2] >= 0.3,][,1]
ESRRA_30 <- ESRRA[ESRRA[,2] >= 0.3,][,1]
stage_30 <- stage[stage[,2] >= 0.3,][,1]
ID_REF_com_30 <- intersect (intersect(MITF_30, ESRRA_30), stage_30)
commonlist_30<- GPL96[GPL96$ID %in% ID_REF_com_30,]$Gene.Symbol
write.table(commonlist_30, file="commonlist_30.txt", sep="\t", col.names = NA)



MITF_40 <- MITF[MITF[,2] >= 0.4,][,1]
ESRRA_40 <- ESRRA[ESRRA[,2] >= 0.4,][,1]
stage_40 <- stage[stage[,2] >= 0.4,][,1]
ID_REF_com_40 <- intersect (intersect(MITF_40, ESRRA_40), stage_40)
commonlist_40<- GPL96[GPL96$ID %in% ID_REF_com_40,]$Gene.Symbol
write.table(commonlist_40, file="commonlist_40.txt", sep="\t", col.names = NA)




















MITF_n50 <- MITF[MITF[,2] <= -0.5,][,1]
ESRRA_n50 <- ESRRA[ESRRA[,2] <= -0.5,][,1]
stage_n50 <- stage[stage[,2] <= -0.5,][,1]
ID_REF_com_n50 <- intersect (intersect(MITF_n50, ESRRA_n50), stage_n50)
commonlist_n50<- GPL96[GPL96$ID %in% ID_REF_com_n50,]$Gene.Symbol
write.table(commonlist_n50, file="commonlist_n50.txt", sep="\t", col.names = NA)


GPL96[GPL96$Gene.Symbol %in% c("MC1R","MAP2K1", "TYR","c-Kit" ),]$ID
GPL96[GPL96$Gene.Symbol %in% c("MAP2K1","MAP2K2", "MAX" ),]$ID


