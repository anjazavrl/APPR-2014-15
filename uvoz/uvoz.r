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
kategorije <- c("Enkrat prvak", "Dvakrat prvak", "Večkrat prvak")
stevilo.naslovov.dirkaca <- character(length(svetovniprvaki$Driver))
veckrat.prvak <- svetovniprvaki$Driver %in% names(which(table(svetovniprvaki$Driver) > 2))
dvakrat.prvak <- svetovniprvaki$Driver %in% names(which(table(svetovniprvaki$Driver) == 2))
enkrat.prvak <- svetovniprvaki$Driver %in% names(which(table(svetovniprvaki$Driver) < 2))
stevilo.naslovov.dirkaca[veckrat.prvak] <- "Večkrat prvak"
stevilo.naslovov.dirkaca[dvakrat.prvak] <- "Dvakrat prvak"
stevilo.naslovov.dirkaca[enkrat.prvak] <- "Enkrat prvak"
Stevilo.Naslovov.Dirkaca <- factor(stevilo.naslovov.dirkaca, levels = kategorije, ordered = TRUE)
Stevilo.naslovov.dirkaca <- data.frame(Sezona = svetovniprvaki$Season, Dirkač = svetovniprvaki$Driver, Država = svetovniprvaki$Country,
                                       Ekipa = svetovniprvaki$Team, Stevilo.Naslovov.Dirkaca)



# source("lib/xml.r", encoding="UTF-8")
# cat("Uvažam podatke o konstruktorskih zmagah.\n")
# konstruktorske.zmage <- uvoz.konstruktorske.zmage()


# Funkcija, ki uvozi podatke iz datoteke konstruktorji2006.csv
uvoziK2006 <- function() {
  return(read.table("podatki/konstruktorji2006.csv", sep = ";", as.is = TRUE,
                    header = TRUE,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico Konstruktorji2006
cat("Uvažam podatke o konstruktorskih zmagah leta 2006...\n")
Konstruktorji2006 <- uvoziK2006()



# Funkcija, ki uvozi podatke iz datoteke konstruktorji2007.csv
uvoziK2007 <- function() {
  return(read.table("podatki/konstruktorji2007.csv", sep = ";", as.is = TRUE,
                    header = TRUE,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico Konstruktorji2007
cat("Uvažam podatke o konstruktorskih zmagah leta 2007...\n")
Konstruktorji2007 <- uvoziK2007()



# Funkcija, ki uvozi podatke iz datoteke konstruktorji2008.csv
uvoziK2008 <- function() {
  return(read.table("podatki/konstruktorji2008.csv", sep = ";", as.is = TRUE,
                    header = TRUE,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico Konstruktorji2008
cat("Uvažam podatke o konstruktorskih zmagah leta 2008...\n")
Konstruktorji2008 <- uvoziK2008()



# Funkcija, ki uvozi podatke iz datoteke konstruktorji2009.csv
uvoziK2009 <- function() {
  return(read.table("podatki/konstruktorji2009.csv", sep = ";", as.is = TRUE,
                    header = TRUE,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico Konstruktorji2009
cat("Uvažam podatke o konstruktorskih zmagah leta 2009...\n")
Konstruktorji2009 <- uvoziK2009()




# Funkcija, ki uvozi podatke iz datoteke konstruktorji2010.csv
uvoziK2010 <- function() {
  return(read.table("podatki/konstruktorji2010.csv", sep = ";", as.is = TRUE,
                    header = TRUE,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico Konstruktorji2010
cat("Uvažam podatke o konstruktorskih zmagah leta 2010...\n")
Konstruktorji2010 <- uvoziK2010()




# Funkcija, ki uvozi podatke iz datoteke konstruktorji2011.csv
uvoziK2011 <- function() {
  return(read.table("podatki/konstruktorji2011.csv", sep = ";", as.is = TRUE,
                    header = TRUE,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico Konstruktorji2011
cat("Uvažam podatke o konstruktorskih zmagah leta 2011...\n")
Konstruktorji2011 <- uvoziK2011()


# Funkcija, ki uvozi podatke iz datoteke konstruktorji2012.csv
uvoziK2012 <- function() {
  return(read.table("podatki/konstruktorji2012.csv", sep = ";", as.is = TRUE,
                    header = TRUE,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico Konstruktorji2012
cat("Uvažam podatke o konstruktorskih zmagah leta 2012...\n")
Konstruktorji2012 <- uvoziK2012()



# Funkcija, ki uvozi podatke iz datoteke konstruktorji2013.csv
uvoziK2013 <- function() {
  return(read.table("podatki/konstruktorji2013.csv", sep = ";", as.is = TRUE,
                    header = TRUE,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico Konstruktorji2013
cat("Uvažam podatke o konstruktorskih zmagah leta 2013...\n")
Konstruktorji2013 <- uvoziK2013()



# Funkcija, ki uvozi podatke iz datoteke konstruktorji2014.csv
uvoziK2014 <- function() {
  return(read.table("podatki/konstruktorji2014.csv", sep = ";", as.is = TRUE,
                    header = TRUE,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico Konstruktorji2014
cat("Uvažam podatke o konstruktorskih zmagah leta 2014...\n")
Konstruktorji2014 <- uvoziK2014()


