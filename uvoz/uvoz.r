# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke sezona2014.csv
uvoziSezona2014 <- function() {
  return(read.table("podatki/sezona2014.csv", sep = ";", as.is = TRUE,
                      row.names = 1, header = TRUE,
                      fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico sezona 2014.
cat("Uvažam podatke o sezoni 2014...\n")
sezona2014 <- uvoziSezona2014()


# Funkcija, ki uvozi podatke iz datoteke svetovniprvaki.csv
uvoziSvetovniprvaki <- function() {
  return(read.table("podatki/svetovniprvaki.csv", sep = ";", as.is = TRUE,
                    header = TRUE,
                    fileEncoding = "Windows-1250"))

}


# Zapišimo podatke v razpredelnico svetovni prvaki.
cat("Uvažam podatke o svetovnih prvakih...\n")
svetovniprvaki <- uvoziSvetovniprvaki()


# Urejenostna spremenljivka
cat("Uvažam urejenostno spremenljivko... \n")
kategorije <- c("Večkrat prvak", "Dva naslova prvaka", "En naslov prvaka")
stevilo.naslovov.dirkaca <- character(length(svetovniprvaki$Driver))
stevilo.naslovov.dirkaca[summary(svetovniprvaki$Driver) > 2] <- "Večkrat prvak"
stevilo.naslovov.dirkaca[summary(svetovniprvaki$Driver) == 2] <- "Dvakrat prvak"
stevilo.naslovov.dirkaca[summary(svetovniprvaki$Driver) < 2] <- "Enkrat prvak"
Stevilo.Naslovov.Dirkaca <- factor(stevilo.naslovov.dirkaca, levels = kategorije, ordered = TRUE)
Stevilo.naslovov.dirkaca <- data.frame(Sezona = svetovniprvaki$Season, Dirkač = svetovniprvaki$Driver, Država = svetovniprvaki$Country,
                                       Ekipa = svetovniprvaki$Team, Stevilo.Naslovov.Dirkaca)


source("lib/xml.r", encoding="UTF-8")
cat("Uvažam podatke o konstruktorskih zmagah.\n")
konstruktorske.zmage <- uvoz.konstruktorske.zmage()


# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
