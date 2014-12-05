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


# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.
