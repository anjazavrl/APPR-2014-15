# 4. faza: Analiza podatkov

stolpci <- union(colnames(Konstruktorji2006), colnames(Konstruktorji2007))
f <- list()
f[[1]] = Konstruktorji2006
f[[2]] = Konstruktorji2007
f[[3]] = Konstruktorji2008
f[[4]] = Konstruktorji2009
f[[5]] = Konstruktorji2010
f[[6]] = Konstruktorji2011
f[[7]] = Konstruktorji2012
f[[8]] = Konstruktorji2013
f[[9]] = Konstruktorji2014
# 
# 
# konstruktorji <- Konstruktorji2006$Konstruktorji
# ITA <- Konstruktorji2006$ITA
# JPN <- Konstruktorji2006$JPN
# Leto <- rep(2006, 11)
# 
# letnica <- c(2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014)
# 
# for(i in 2 : 9)
# {
#   len <- length(f[[i]]$Konstruktorji)
#   konstruktorji <- c(konstruktorji, f[[i]]$Konstruktorji)
#   ITA <- c(ITA, f[[i]]$ITA)
#   JPN <- c(JPN, f[[i]]$JPN)
#   l <- rep(letnica[[i]], len)
#   Leto <- c(Leto, l)
# }
konstruktorji <- unlist(sapply(f, function(x) x$Konstruktorji))
ITA <- unlist(sapply(f, function(x) x$ITA))
JPN <- unlist(sapply(f, function(x) x$JPN))
Leto <- unlist(sapply(1:length(f), function(i) rep(2005+i, nrow(f[[i]]))))



bmw <- grep("BMW", konstruktorji)
konstruktorji[bmw] <- "BMW"
mercedes <- grep("Mercedes", konstruktorji)
konstruktorji[mercedes] <- "Mercedes"
ferrari <- grep("Ferrari", konstruktorji)
konstruktorji[ferrari] <- "Ferrari"
renault <- grep("Renault", konstruktorji)
konstruktorji[renault] <- "Renault"
honda <- grep("Honda", konstruktorji)
konstruktorji[honda] <- "Honda"
toyota <- grep("Toyota", konstruktorji)
konstruktorji[toyota] <- "Toyota"
cosworth <- grep("Cosworth", konstruktorji)
konstruktorji[cosworth] <- "Cosworth"


# motorOznake <- rep(0, 100)
# for(i in 1 : length(konstruktorji))
# {
#   if(konstruktorji[i] == "Renault"){
#     motorOznake[i] = 1
#   }
#   else if(konstruktorji[i] == "Mercedes"){
#     motorOznake[i] = 2
#   }
#   else if(konstruktorji[i] == "Ferrari"){
#     motorOznake[i] = 3
#   }
#   else if(konstruktorji[i] == "Honda"){
#     motorOznake[i] = 4
#   }
#   else if(konstruktorji[i] == "BMW"){
#     motorOznake[i] = 5
#   }
#   else if(konstruktorji[i] == "Toyota"){
#     motorOznake[i] = 6
#   }
#   else if(konstruktorji[i] == "Cosworth"){
#     motorOznake[i] = 7
#   }
# }
motorOznake <- as.numeric(factor(konstruktorji))
#********************
Leto <- as.numeric(Leto)
ITA <- as.numeric(ITA)
JPN <- as.numeric(JPN)
itajpn <- data.frame(MOTOR = konstruktorji,  OZNAKA = motorOznake, LETO = Leto, ITA, JPN)
itajpn[is.na(itajpn)] <- 0


breztock <- which(itajpn$ITA == 0 & itajpn$JPN == 0)
itajpn <- itajpn[-breztock, ]

#********************

# razdeli <- 1:59
# train <- itajpn[razdeli,]
# test <- itajpn[-razdeli,]

# 
# premicaIta <- lm(OZNAKA ~ LETO + ITA, data = train)
# napovedi <- ceiling(predict(premicaIta, test))







#____________________________________________

K2011 <- Konstruktorji2011[order(Konstruktorji2011$Konstruktorji), ]
K2011 <- K2011[-c(3, 8, 11), ]
K2011$Konstruktorji[agrep("Williams Cosworth",K2011$Konstruktorji)]<-"Williams"
K2011$Konstruktorji[agrep("Toro Rosso Ferrari",K2011$Konstruktorji)]<-"Toro Rosso"


K2012 <- Konstruktorji2012[order(Konstruktorji2012$Konstruktorji), ]
K2012 <- K2012[-c(1, 4, 6), ]
K2012$Konstruktorji[agrep("Williams Renault",K2012$Konstruktorji)]<-"Williams"
K2012$Konstruktorji[agrep("Toro Rosso Ferrari",K2012$Konstruktorji)]<-"Toro Rosso"


K2013 <- Konstruktorji2013[order(Konstruktorji2013$Konstruktorji), ]
K2013 <- K2013[-c(1, 5), ]
K2013$Konstruktorji[agrep("Williams Renault",K2013$Konstruktorji)]<-"Williams"
K2013$Konstruktorji[agrep("Toro Rosso Ferrari",K2013$Konstruktorji)]<-"Toro Rosso"


K2014 <- Konstruktorji2014[order(Konstruktorji2014$Konstruktorji), ]
K2014 <- K2014[-c(1, 5), ]
K2014$Konstruktorji[agrep("Williams Mercedes",K2014$Konstruktorji)]<-"Williams"
K2014$Konstruktorji[agrep("Toro Rosso Renault",K2014$Konstruktorji)]<-"Toro Rosso"

K2015 <- Konstruktorji2015[order(Konstruktorji2015$Konstruktorji), ]
K2015 <- K2015[-c(4), ]
K2015$Konstruktorji[agrep("Williams Mercedes",K2015$Konstruktorji)]<-"Williams"
K2015$Konstruktorji[agrep("Toro Rosso Renault",K2015$Konstruktorji)]<-"Toro Rosso"


Italija <- data.frame(I2011 = K2011$ITA, I2012 = K2012$ITA, I2013 = K2013$ITA, I2014 = K2014$ITA)
row.names(Italija) <- K2011$Konstruktorji



Japonska <- data.frame(J2011 = K2011$JPN, J2012 = K2012$JPN, J2013 = K2013$JPN, J2014 = K2014$JPN)
row.names(Japonska) <- K2011$Konstruktorji


pdf("slike/Italija.pdf")

m <- apply(Italija, 1, function(x) as.numeric(x[1]))
barplot(m, beside=TRUE, main ='Stevilo tock ekip leta 2011', sub
        ='Ekipe', ylab = 'Stevilo tock', col = c('seagreen1'),
        las=2, cex.names=0.6)

m <- apply(Italija, 1, function(x) as.numeric(x[2]))
barplot(m, beside=TRUE, main ='Stevilo tock ekip leta 2012', sub
        ='Ekipe', ylab = 'Stevilo tock', col = c('salmon'),
        las=2, cex.names=0.6)

m <- apply(Italija, 1, function(x) as.numeric(x[3]))
barplot(m, beside=TRUE, main ='Stevilo tock ekip leta 2013', sub
        ='Ekipe', ylab = 'Stevilo tock', col = c('royalblue1'),
        las=2, cex.names=0.6)


m <- apply(Italija, 1, function(x) as.numeric(x[4]))
barplot(m, beside=TRUE, main ='Stevilo tock ekip leta 2014', sub
        ='Ekipe', ylab = 'Stevilo tock', col = c('turquoise'),
        las=2, cex.names=0.6)


m <- apply(K2015, 1, function(x) as.numeric(x[13]))
barplot(m, beside=TRUE, main ='Stevilo tock ekip leta 2015', sub
        ='Ekipe', ylab = 'Stevilo tock', col = c('slateblue1'),
        las=2, names.arg=K2015$Konstruktorji, cex.names=0.6)

dev.off()



pdf("slike/Japonska.pdf")

m <- apply(Japonska, 1, function(x) as.numeric(x[1]))
barplot(m, beside=TRUE, main ='Stevilo tock ekip leta 2011', sub
        ='Ekipe', ylab = 'Stevilo tock', col = c('seagreen1'),
        las=2, cex.names=0.6)

m <- apply(Japonska, 1, function(x) as.numeric(x[2]))
barplot(m, beside=TRUE, main ='Stevilo tock ekip leta 2012', sub
        ='Ekipe', ylab = 'Stevilo tock', col = c('salmon'),
        las=2, cex.names=0.6)

m <- apply(Japonska, 1, function(x) as.numeric(x[3]))
barplot(m, beside=TRUE, main ='Stevilo tock ekip leta 2013', sub
        ='Ekipe', ylab = 'Stevilo tock', col = c('royalblue1'),
        las=2, cex.names=0.6)


m <- apply(Japonska, 1, function(x) as.numeric(x[4]))
barplot(m, beside=TRUE, main ='Stevilo tock ekip leta 2014', sub
        ='Ekipe', ylab = 'Stevilo tock', col = c('turquoise'),
        las=2, cex.names=0.6)

dev.off()

