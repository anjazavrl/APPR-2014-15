library(XML)

# Vrne vektor nizov z odstranjenimi začetnimi in končnimi "prazninami" (whitespace)
# iz vozlišč, ki ustrezajo podani poti.
stripByPath <- function(x, path) {
  unlist(xpathApply(x, path,
                    function(y) gsub("^\\s*(.*?)\\s*$", "\\1", xmlValue(y))))
}

uvoz.konstruktorske.zmage <- function() {
  url.konstruktorske.zmage <- "http://en.wikipedia.org/wiki/List_of_Formula_One_World_Drivers%27_Champions#By_constructor"
  doc.konstruktorske.zmage <- htmlTreeParse(url.konstruktorske.zmage,encoding = "UTF-8", useInternalNodes=TRUE)
  
  # Poiščemo vse tabele v dokumentu
  tabele <- getNodeSet(doc.konstruktorske.zmage, "//table")
  
  # Iz šeste tabele dobimo seznam vrstic (<tr>) neposredno pod
  # trenutnim vozliščem
  vrstice <- getNodeSet(tabele[[6]], "./tr")
  
  # Seznam vrstic pretvorimo v seznam (znakovnih) vektorjev
  # s porezanimi vsebinami celic (<td>) neposredno pod trenutnim vozliščem
  seznam <- lapply(vrstice[2:length(vrstice)], stripByPath, "./td")
  
  # Iz seznama vrstic naredimo matriko
  matrika <- matrix(unlist(seznam), nrow=length(seznam), byrow=TRUE)
  
  # Imena stolpcev matrike dobimo iz celic (<th>) glave (prve vrstice) prve tabele
  colnames(matrika) <- gsub("\n", " ", stripByPath(vrstice[[1]], ".//th"))
  
  # Podatke iz matrike spravimo v razpredelnico
  return(data.frame(Country = gsub("^.(.*)$", "\\1", matrika[,2]),
                    Total = as.numeric(matrika[,3]), row.names = matrika[,1]))
  
}
