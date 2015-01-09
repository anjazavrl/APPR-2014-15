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


# Narišimo zemljevid v PDF.
cat("Rišem zemljevid...\n")
pdf("slike/Zmage_po_drzavah.pdf", width=10, height=8)

n = max(t)
u <- unique(t)
u <- u[order(u)]
barve <- rgb(0, 0, 1, match(t, u)/length(u))
plot(svet, col = barve[as.character(svet$name_long)], border = "grey")
title("Število svetovnih prvakov po državah")
legend("left", legend = u, fill = rgb(0, 0, 1, (1:length(u))/length(u)), bg="white")

#imena držav
text(coordinates(drzave[c("dolzina", "sirina")]), labels = drzave$drzava, col = "black", cex = 0.8)

dev.off()