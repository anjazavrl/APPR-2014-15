pdf("slike/graf.pdf", paper="a4")
barplot(sezona2014$Points[1:5], main = "Število točk prvih pet dirkačev v sezoni 2014", 
        xlab="Dirkači", names.arg=sezona2014$Driver[1:5])
dev.off()

