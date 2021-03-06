pdf("slike/graf1.pdf")
barplot(sezona2014$Points[1:5], main = "Število točk prvih pet dirkačev v sezoni 2014", 
        xlab="Dirkači", names.arg=sezona2014$Driver[1:5], cex.names = 0.75)
dev.off()

pdf("slike/graf2.pdf")
lbls <- row.names(konstruktorske.zmage)[1:10]
pct <- round(konstruktorske.zmage$Total[1:10]/sum(konstruktorske.zmage$Total[1:10])*100)
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
pie(konstruktorske.zmage$Total[1:10], labels = lbls, col=rainbow(length(lbls)), main = "Delež konstruktorskih zmag v Formuli 1 - prvih 10 ekip")
dev.off()