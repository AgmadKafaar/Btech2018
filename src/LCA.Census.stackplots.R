lcmodel <- reshape2::melt(lc6$probs, level=2)
zp2 <- ggplot(lcmodel,aes(x = Var1, y = value, fill = Var2))
zp2 <- zp2 + geom_bar(stat = "identity", position = "stack")
zp2 <- zp2 + facet_wrap(~ L2)
zp2 <- zp2 + scale_x_discrete("Gentrification Features", expand = c(0, 0))
zp2 <- zp2 + scale_y_continuous("Probabilities \nof \ncategories", expand = c(0, 0))
zp2 <- zp2 + scale_fill_brewer(type="seq", palette="Reds") +
  theme_bw()
zp2 <- zp2 + labs(fill ="Categories")
zp2 <- zp2 + theme( axis.text.y=element_blank(),
                    axis.ticks.y=element_blank(),                    
                    panel.grid.major.y=element_blank()#,
                    #legend.justification=c(1,0), 
                    #legend.position=c(1,0)
)
zp2 <- zp2 + guides(fill = guide_legend(reverse=TRUE))
print(zp2)