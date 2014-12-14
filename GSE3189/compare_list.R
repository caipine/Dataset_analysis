ESRRA <-read.table(file="correlation_ESRRA_1487_at.txt", header=TRUE, sep="\t")
MITF <-read.table(file="correlation_MITF_207233_s_at.txt", header=TRUE, sep="\t")
stage <-read.table(file="correlation_with_others___stage.txt", header=TRUE, sep="\t")



MITF_50 <- MITF[MITF[,2] >= 0.5,][,1]
ESRRA_50 <- ESRRA[ESRRA[,2] >= 0.5,][,1]
stage_50 <- stage[stage[,2] >= 0.5,][,1]

intersect (intersect(MITF_50, ESRRA_50), stage_50)

