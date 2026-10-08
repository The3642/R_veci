# cast A----- cast A

# uloha 1 ------
den_nar = 23
mesic_nar = 1
rok_nar = 2007
pocet_osob = 3L
class(pocet_osob)
typeof(pocet_osob)
pokus <- 4 
# díky L je to cele nvm more ?????????????




#uloha 2  -----
prijmeni <- "papacek"
oblibene_cislo <- 6

# prijmeni * 2, in prijmeni* 2 : non-numeric argument to binary operator

cislo_textem <- "12"
as.numeric(cislo_textem) + oblibene_cislo

c(oblibene_cislo, TRUE, prijmeni)
class(c) 
# funkce diky c ????????????






# uloha 3 -----
osobni_klic <- c(den_nar * mesic_nar + oblibene_cislo)
rok_nar %% 20
rok_nar %/% 100  # nevim jak jsem toto udelal lol 









# uloha 4----
help(round)
# x a digits
#vychozi ma digits a to 0 ????????????

round(osobni_klic/7, 2)

log(base = den_nar, x = osobni_klic)

den_nar_0 <- 1
log(base = den_nar_0, x = osobni_klic)
# Logaritmus o základu 1 není definován, R vrací Inf kvůli dělení nulou ??????







#uloha 5 -----
pocet_hodinek <- NA
class(pocet_hodinek)

1/0 
0/0

pocet_hodinek + 1 
pocet_hodinek == NA 

# 1/0 vyjde Inf, limita dělení kladného čísla nulou roste do nekonečna.
# 0/0 vyjde NaN jako "neni cislo" protoze to neni cislo :)

# nejde porovnavat neexistujici hodnota a neexistujici hodnota muze tam byt cokoliv
is.na(pocet_hodinek)






# uloha 6 -----
osobni_klic > 20 & pocet_osob < 10
oblibene_cislo % ě == 1 I rok_narozeni > 2005 #???????


#---- cast b 
dny <- c("po", "ut", "st", "ct", "pa", "so", "ne")
kroky <- c(6200, 4800, 3300, 5900, 4300, 2700, NA)
kroky <- names(dny)
kroky
names(dny[-1]), 


