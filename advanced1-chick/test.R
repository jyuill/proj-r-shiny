

library(dplyr)
library(ggplot2)

chw <- ChickWeight
chw.sel <- chw %>% filter(Chick=="1"|Chick=="2"|Chick=="3"|Chick=="4"|Chick=="5")
multi <- rnorm(length(chw.sel$weight),0,1)
chw.sel <- chw.sel %>% mutate(other=weight*multi)

ggplot(chw.sel, aes(x=Time, y=weight))+geom_bar(stat="identity")+
  facet_grid(.~Chick)

ggplot(chw.sel, aes(x=Time, y=other))+geom_line()+
  facet_grid(.~Chick)

chw.sel$Chick 
ch <- as.character(chw.sel$Chick)
distinct(ch)

ch <- chw.sel %>% group_by(Chick) %>% summarize(wt=sum(weight)) %>% select(Chick)
chl <- as.list(ch)
chl

unique(chw.sel$Chick)
unique(chw.sel$Chick)[3]
