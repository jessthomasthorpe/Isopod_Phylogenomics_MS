
library(ggplot2)
library(patchwork)
library(tidyverse)


# Script to plot % gene trees vs topology info
# started on 6/7/23

getwd()
setwd(dir = 'Documents/_Isopoda/R_plotting/') # 

# read file
df1 <- read.csv('Gene_concordance/1_Crinocheta.csv')
df2 <- read.csv('Gene_concordance/2_Synocheta.csv')
df3 <- read.csv('Gene_concordance/3_Sphaeromatoidea.csv')
df4 <- read.csv('Gene_concordance/4_Asellota.csv')
df5 <- read.csv('Gene_concordance/5_Isopoda.csv')
df6 <- read.csv('Gene_concordance/6_Oniscidea.csv')
df7 <- read.csv('Gene_concordance/7_CLVS_Oniscidea.csv')
df8 <- read.csv('Gene_concordance/8_Cymothooidea.csv')
df9 <- read.csv('Gene_concordance/9_Valvifera_Sphaero.csv')
df10 <- read.csv('Gene_concordance/10_CVS.csv')
df11 <- read.csv('Gene_concordance/11_CLVS.csv')
df12 <- read.csv('Gene_concordance/12_Diplocheta_Tylida.csv')


# filter dataframe to just keep columns we're interested in
df1 <- df1[,c(1, 5, 8, 11, 15)]
df2 <- df2[,c(1, 5, 8, 11, 15)]
df3 <- df3[,c(1, 5, 8, 11, 15)]
df4 <- df4[,c(1, 5, 8, 11, 15)]
df5 <- df5[,c(1, 5, 8, 11, 15)]
df6 <- df6[,c(1, 5, 8, 11, 15)]
df7 <- df7[,c(1, 5, 8, 11, 15)]
df8 <- df8[,c(1, 5, 8, 11, 15)]
df9 <- df9[,c(1, 5, 8, 11, 15)]
df10 <- df10[,c(1, 5, 8, 11, 15)]
df11 <- df11[,c(1, 5, 8, 11, 15)]
df12 <- df12[,c(1, 5, 8, 11, 15)]

# rename columns to nice names
colnames(df1) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')
colnames(df2) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')
colnames(df3) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')
colnames(df4) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')
colnames(df5) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')
colnames(df6) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')
colnames(df7) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')
colnames(df8) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')
colnames(df9) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')
colnames(df10) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')
colnames(df11) <- c('per', 'Current topology', 'Limn+V/S', 'Limn+Cymo', 'Polyphyly')
colnames(df12) <- c('per', 'Current topology', 'Erhard', 'Basal Tylida', 'Polyphyly')

# convert from wide to long format of dataframe
df1 <- gather(df1, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)
df2 <- gather(df2, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)
df3 <- gather(df3, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)
df4 <- gather(df4, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)
df5 <- gather(df5, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)
df6 <- gather(df6, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)
df7 <- gather(df7, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)
df8 <- gather(df8, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)
df9 <- gather(df9, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)
df10 <- gather(df10, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)
df11 <- gather(df11, pattern, prop, c('Current topology', 'Limn+V/S', 'Limn+Cymo', 'Polyphyly'), factor_key=TRUE)
df12 <- gather(df12, pattern, prop, c('Current topology', 'Erhard', 'Basal Tylida', 'Polyphyly'), factor_key=TRUE)

# generate plot
first_plot <- ggplot(data=df1, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") + 
  guides(col=guide_legend(title="ALL NODES")) +
  ggtitle("A: CRINOCHETA")

second_plot <- ggplot(data=df2, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") + 
  guides(col=guide_legend(title="B: 'SYNOCHETA'")) +
  theme(legend.position = "none") +
  ggtitle("B: SYNOCHETA")

third_plot <- ggplot(data=df3, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") + 
  guides(col=guide_legend(title="C: SPHAEROMATOIDEA")) +
  theme(legend.position = "none") +
  ggtitle("C: SPHAEROMATOIDEA")

fourth_plot <- ggplot(data=df4, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") + 
  guides(col=guide_legend(title="D: ASELLOTA")) +
  theme(legend.position = "none") +
  ggtitle("D: ASELLOTA")

fifth_plot <- ggplot(data=df5, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") + 
  guides(col=guide_legend(title="E: ISOPODA")) +
  theme(legend.position = "none") +
  ggtitle("E: ISOPODA")

sixth_plot <- ggplot(data=df6, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") + 
  guides(col=guide_legend(title="F: ONISCIDEA")) +
  theme(legend.position = "none") +
  ggtitle("F: ONISCIDEA")

seventh_plot <- ggplot(data=df7, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="Proportion of gene trees supporting topology") + 
  guides(col=guide_legend(title="G: ONISCIDEA+'CLVS'")) +
  theme(legend.position = "none") +
  ggtitle("G: ONISCIDEA+'CLVS'")

eigth_plot <- ggplot(data=df8, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") + 
  guides(col=guide_legend(title="H: CYMOTHOOIDEA")) + ylim(0,1) + 
  theme(legend.position = "none") +
  ggtitle("H: CYMOTHOOIDEA")

ninth_plot <- ggplot(data=df9, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") + 
  guides(col=guide_legend(title="I: VS")) +
  theme(legend.position = "none") +
  ggtitle("I: VALVIFERA+SPHAEROMATIDEA") 

tenth_plot <- ggplot(data=df10, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") + 
  guides(col=guide_legend(title="J: CVS"))  +
  theme(legend.position = "none") +
  ggtitle("J: CVS")

eleventh_plot <- ggplot(data=df11, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="Percentage of shortest genes removed", y="") + 
  guides(col=guide_legend(title="K: 'CLVS'")) +
  ggtitle("K: 'CLVS'")

twelfth_plot <- ggplot(data=df12, aes(x=per, y=prop)) + ylim(0,1) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") +
  guides(col=guide_legend(title="L: Diplocheta+Tylida")) +
  ggtitle("L: DIPLOCHETA+TYLIDA")  

combined_plot <- first_plot + second_plot + third_plot + fourth_plot + 
                fifth_plot + sixth_plot + seventh_plot + eigth_plot + ninth_plot +tenth_plot + 
                eleventh_plot + twelfth_plot +
  labs(x="", y="") +
  plot_layout(nrow=4) +
  plot_layout(guides = "collect") +
  theme(axis.title = element_text(hjust=0))

combined_plot



# view plot

#ggsave(plot=first_plot, file='first_plot.pdf', width=7, height=4)

# save plot
#ggsave(plot=second_plot, file='second_plot.pdf', width=7, height=4)

# save plot
#ggsave(plot=third_plot, file='third_plot.pdf', width=7, height=4)

