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


konstruktorji <- Konstruktorji2006$Konstruktorji
ITA <- Konstruktorji2006$ITA
JPN <- Konstruktorji2006$JPN
Leto <- rep(2006, 11)

letnica <- c(2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014)

for(i in 2 : 9)
{
  len <- length(f[[i]]$Konstruktorji)
  konstruktorji <- c(konstruktorji, f[[i]]$Konstruktorji)
  ITA <- c(ITA, f[[i]]$ITA)
  JPN <- c(JPN, f[[i]]$JPN)
  l <- rep(letnica[[i]], len)
  Leto <- c(Leto, l)
}

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


motorOznake <- rep(0, 101)
for(i in 1 : length(konstruktorji))
{
  if(konstruktorji[i] == "Renault"){
    motorOznake[i] = 1
  }
  else if(konstruktorji[i] == "Mercedes"){
    motorOznake[i] = 2
  }
  else if(konstruktorji[i] == "Ferrari"){
    motorOznake[i] = 3
  }
  else if(konstruktorji[i] == "Honda"){
    motorOznake[i] = 4
  }
  else if(konstruktorji[i] == "BMW"){
    motorOznake[i] = 5
  }
  else if(konstruktorji[i] == "Toyota"){
    motorOznake[i] = 6
  }
  else if(konstruktorji[i] == "Cosworth"){
    motorOznake[i] = 7
  }
}

#********************
motorOznake <- as.numeric(motorOznake)
Leto <- as.numeric(Leto)
ITA <- as.numeric(ITA)
JPN <- as.numeric(JPN)
itajpn <- data.frame(MOTOR = konstruktorji,  OZNAKA = motorOznake, LETO = Leto, ITA, JPN)
itajpn[is.na(itajpn)] <- 0

breztock <- which(itajpn$ITA == 0 & itajpn$JPN == 0)
itajpn <- itajpn[-breztock, ]

#********************

razdeli <- 1:59
train <- itajpn[razdeli,]
test <- itajpn[-razdeli,]


premicaIta <- lm(OZNAKA ~ LETO + ITA, data = train)
napovedi <- ceiling(predict(premicaIta, test))
