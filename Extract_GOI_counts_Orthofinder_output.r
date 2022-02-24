######### Extract counts for genes of interest from Orthofinder output #########

cnt=read.table("./Input_files/Orthogroups.GeneCount.txt", header=TRUE, row.names = NULL, sep= "\t")
cnts.sor=cnt[ , order(names(cnt))]
colnames(cnts.sor)=gsub(".fa.longest.variant.pep", "", colnames(cnts.sor))
cnts2= subset(cnts.sor, select = -c(25)) 

gene=read.table("./Input_files/goi_orthogroups_hypoxia.txt", header=TRUE, row.names= NULL, sep= "\t")
sub_cnts2=subset(cnts2, cnts2$Orthogroup %in% gene$Orthogroup) 

#abbreviate species names to fit into table
sub_cnts2$gene<- gene$Gene.name[match(sub_cnts2$Orthogroup,gene$Orthogroup)] 
sub_cnts2 <- sub_cnts2[, c(21,28,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,22,23,24,25,26,27)]
colnames(sub_cnts2)=gsub("Acropora", "A", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("Mc", "Monta.c", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("Montipora.", "M.", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.acuminata_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.awi_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.cytherea_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.digitifera_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.echinata_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.florida_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.gemmifera_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.hyacinthus_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.intermedia_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.microphthalma_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.muricata_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.nasta_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.selago_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.tenuis_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("A.yongei_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("Amil.all.maker.proteins", "amil", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("Astreopora.spp_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("ernosa.maker.proteins", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("M.cactus_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("M.efflorescens_", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("pdam_proteins", "pdam", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("2v1.1.proteins", "", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("Pver_proteins_names_v1.0", "pver", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("Spis.genome.annotation.pep.longest", "spis", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("Monta.", "m", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("Orthogroup", "OG", colnames(sub_cnts2))
colnames(sub_cnts2)=gsub("variance", "var", colnames(sub_cnts2))

sub_cnts2<-sub_cnts2[order(-sub_cnts2$var),] #descending order 
rownames(sub_cnts2) <- NULL #to prevent row numbers printing
write.table(sub_cnts2, "Orthogroups _goi_counts.csv", sep = ",", quote = FALSE, row.names = FALSE) 

#Then read in table to markdown script to produce heatmap table
