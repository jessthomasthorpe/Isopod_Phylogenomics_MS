library(ggtree)
library(gtable)
library(ggplot2)
library(ggrepel)

#IsopodatreeGenome<-read.tree("Isopoda.Gnathid.mafft.supermx.tree")
#meta<-read.table("Figures_R/Metadata_genome_Gnathiid.table",header=TRUE)

#p <- ggtree(IsopodatreeGenome) + geom_text(aes(label=node))
#rotate(tree_view = NULL, node)
#print(meta)

IsopodatreeGenome<-read.tree("Isopoda.all.fsa.trim.concordance.cf.tree")
meta<-read.table("Figures_R/Metadata_genome.table",header=TRUE)

groupInfo <-split(meta$Taxon, meta$Group)
#print(groupInfo)
IsopodatreeGenome<-groupOTU(IsopodatreeGenome,groupInfo)

my_colors <- unique(meta$Colour[order(meta$Group)])
#print(my_colors)
my_colors_21 <- c('#2D2D2D',my_colors) #switch these around for dS or if colours in wrong order
#print(my_colors_21)
t2 <-ggtree(IsopodatreeGenome, aes(color=group))+scale_colour_manual(guide = FALSE, values = my_colors_21)  
#t2
t2 + geom_tiplab(as_ylab=FALSE, size=5, color='black', fontface = "italic", hjust=-.1) + geom_text2(aes(subset = !isTip,label=label),size=2, color='black', hjust=-.1) + ggplot2::xlim(0, 1.5)
#nodelabels(text = IsopodatreeGenome$node.label, frame = "n", cex=0.8, col= "black")

