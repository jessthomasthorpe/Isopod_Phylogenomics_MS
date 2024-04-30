library(ggtree)
library(gtable)
library(dplyr)
library(ggplot2)
library(phytools)

#Load trees
Isopodatree18S<-read.tree("Isopoda.edit20.18S.con.tree")
IsopodatreeGenome<-read.tree("Isopoda.edit20.con.tree")

#Load metadata with colour info.
meta<-read.table("Metadata.table",header=TRUE)

#Colour branches in trees
groupInfo <-split(meta$Taxon, meta$Group)
Isopodatree18S<-groupOTU(Isopodatree18S,groupInfo)
IsopodatreeGenome<-groupOTU(IsopodatreeGenome,groupInfo)
my_colors <- unique(meta$Colour[order(meta$Group)])

#Need an extra colour for internal branches
my_colors_21 <- c('#2D2D2D',my_colors)
t1 <-ggtree(IsopodatreeGenome, aes(color=group))+scale_colour_manual(values = my_colors_21)
t2 <-ggtree(Isopodatree18S, aes(color=group))+scale_colour_manual(values = my_colors_21)


#Produce tree with node labels for rotation
#p <- ggtree(Isopodatree18S) + geom_text(aes(label=node))

#Rotate nodes in Genome tree
list_nodes_t1 <- c()
for (x1 in list_nodes_t1) {
  t1 <- ggtree::rotate(t1, x1) 
  }

#Rotate nodes in 18S tree
list_nodes_t2 <- c(178,213,179,236,306)
for (x2 in list_nodes_t2) {
  t2 <- ggtree::rotate(t2, x2)
  }

#Add tangles between trees, following tutorial https://arftrhmn.net/how-to-make-cophylogeny/
d1 <- t1$data
d2 <- t2$data
d1$tree <-'t1'
d2$tree <-'t2'
d2$x <- max(d2$x) - d2$x + max(d1$x) + max(d1$x)*0.3 
dd <- bind_rows(d1, d2) %>% filter(isTip == TRUE) 
dd1 <- as.data.frame(dd) 
pp <- t1 + geom_tree(data=d2)

#Plot tree with coloured tangles
#pp + geom_line(aes(x, y, group=label, colour=dd1$group), data=dd1, linetype = "dotted")+scale_color_manual(values = my_colors_21)

#Plot tree with grey tangles
pp + geom_line(aes(x, y, group=label), data=dd1, color='grey', linetype = "dotted")

