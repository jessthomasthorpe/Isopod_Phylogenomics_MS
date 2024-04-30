
library(ggplot2)
library(patchwork)
library(tidyverse)


# Script to plot % gene trees vs topology info

# read file
df <- read.csv('Oniscidea.csv')
df2 <- read.csv('Limn.csv')
df3 <- read.csv('Asellota.csv')

# filter dataframe to just keep columns of interest
df <- df[,c(1, 5, 8, 11, 15)]
df2 <- df2[,c(1, 5, 8, 11, 15)]
df3 <- df3[,c(1, 5, 8, 11, 15)]

# rename columns to nice names
colnames(df) <- c('per', 'Current topology', 'Erhard', 'Basal Tylida', 'Polyphyly')
colnames(df2) <- c('per', 'Current topology', 'Limn+Cymo', 'Limn+V/S', 'Polyphyly')
colnames(df3) <- c('per', 'Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly')

# convert from wide to long format of dataframe
df <- gather(df, pattern, prop, c('Current topology', 'Erhard', 'Basal Tylida', 'Polyphyly'), factor_key=TRUE)
df2 <- gather(df2, pattern, prop, c('Current topology', 'Limn+Cymo', 'Limn+V/S', 'Polyphyly'), factor_key=TRUE)
df3 <- gather(df3, pattern, prop, c('Current topology', 'Alternate topology 2', 'Alternate topology 3', 'Polyphyly'), factor_key=TRUE)

# generate plot
first_plot <- ggplot(data=df, aes(x=per, y=prop)) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="Percentage of shortest genes removed", y="") + 
  guides(col=guide_legend(title="B: ONISCIDEA"))

second_plot <- ggplot(data=df2, aes(x=per, y=prop)) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="") + 
  guides(col=guide_legend(title="C: 'CLVS'"))

third_plot <- ggplot(data=df3, aes(x=per, y=prop)) + 
  geom_point(aes(col=pattern)) + theme_bw() + 
  labs(x="", y="Proportion of gene trees supporting topology") + 
  guides(col=guide_legend(title="A: ASELLOTA"))


combined_plot <- third_plot + first_plot + second_plot + plot_annotation(tag_levels = 'A') +  plot_layout(nrow=1) +
  plot_layout(guides = "collect")

# view plot
combined_plot

# save plots
ggsave(plot=first_plot, file='first_plot.pdf', width=7, height=4)
ggsave(plot=second_plot, file='second_plot.pdf', width=7, height=4)
ggsave(plot=third_plot, file='third_plot.pdf', width=7, height=4)
