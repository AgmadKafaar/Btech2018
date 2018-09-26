# plot 1

# Order categories of results$model in order of appearance


library("forcats")
results$Model <- as_factor(results$Model) 
#convert to long format
results2<-tidyr::gather(results,Kriterium,Guete,4:7)
results2

#plot
fit.plot<-ggplot(results2) + 
  geom_point(aes(x=Model,y=Guete),size=3) +
  geom_line(aes(Model, Guete, group = 1)) +
  theme_bw()+
  labs(x = "", y="", title = "") + 
  facet_grid(Kriterium ~. ,scales = "free") +
  theme_bw(base_size = 16, base_family = "") +   
  theme(panel.grid.major.x = element_blank() ,
        panel.grid.major.y = element_line(colour="grey", size=0.5),
        legend.title = element_text(size = 16, face = 'bold'),
        axis.text = element_text(size = 16),
        axis.title = element_text(size = 16),
        legend.text=  element_text(size=16),
        axis.line = element_line(colour = "black")) # Achsen etwas dicker

# save 650 x 800
fit.plot