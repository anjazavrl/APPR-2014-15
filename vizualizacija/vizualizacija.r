# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                          "Svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                          encoding = "Windows-1250")


t <- table(Stevilo.naslovov.dirkaca$Država)

najvec.zmag <- max(t)
najmanj.zmag <- min(t)

u <- unique(t)
u <- u[order(u)]
barve <- rgb(0, 0, 1, match(t, u)/length(u))
names(barve) <- names(t)

# Narišimo zemljevide v PDF.
cat("Rišem 1. zemljevid...\n")
pdf("slike/Zmage_po_drzavah.pdf", width=10, height=8)

plot(svet, col = barve[as.character(svet$name_long)], border = "grey")
title("Število svetovnih prvakov po državah")
legend("left", legend = u, fill = rgb(0, 0, 1, (1:length(u))/length(u)), bg="white")


# pripravimo koordinate držav
koord.orig <- coordinates(svet[match(names(t), svet$name_long),])
rownames(koord.orig) <- names(t)
# spreminjali bomo koordinate imen
koord.ime <- koord.orig
imena <- names(t)
# pripravimo vektor imen
names(imena) <- names(t)
# pripravimo vektor pozicij
pos <- rep(1, length(t))
names(pos) <- names(t)
# pripravimo vektor odmikov
offset <- rep(0, length(t))
names(offset) <- names(t)
# povemo, katere države bomo pokazali s črto
zamaknjene <- c("Austria", "France", "Italy", "United Kingdom")
offset[zamaknjene] <- 0.5

# priredimo pozicije imen držav
koord.ime["Austria",1] <- koord.ime["Austria",1] + 10 # premik po osi x
koord.ime["France",1] <- koord.ime["France",1] - 7 # premik po osi x
koord.ime["United Kingdom",2] <- koord.ime["United Kingdom",2] + 8 # premik po osi y
koord.ime["Italy",] <- koord.ime["Italy",] + c(6, -8) # premik po obeh oseh

# povemo, kje glede na točko naj bo prikazano ime
pos["Austria"] <- 4 # desno
pos["France"] <- 2 # levo
pos["Italy"] <- 1 # spodaj
pos["United Kingdom"] <- 3 # zgoraj

# priredimo imena
imena["United Kingdom"] <- "UK"

# izpišemo imena
text(koord.ime, labels = imena, col = "black", cex = 0.6, pos = pos, offset = offset)

# narišemo črte
for (drzava in zamaknjene) {
  lines(c(koord.ime[drzava,1], koord.orig[drzava,1]),
        c(koord.ime[drzava,2], koord.orig[drzava,2]))
}

dev.off()
