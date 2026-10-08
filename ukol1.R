den_nar <- 23
mesic_nar <- 1
rok_nar <- 2007
den_nar 
mesic_nar 
rok_nar

pocet_osob <- 3L  # proc to fucking L 
class(pocet_osob)
typeof(pocet_osob)

pokus <- 4 
class(pokus)
typeof(pokus)
#  dyk more nevím 

prijmeni <- "papacek"
oblibene_cislo <- 6
# prijmeni * 2 , in prijmeni * 2 : non-numeric argument to binary operator
cislo_textem <- "12"
as.numeric(cislo_textem) + oblibene_cislo

c(oblibene_cislo, TRUE, prijmeni)
class(c)# bude numeric protoze jsem to na to convertoval 