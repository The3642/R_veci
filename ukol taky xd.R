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
oblibene_cislo %/% 2 == 1 |rok_nar > 2005

#nevim ??????????????????




# cast B ------
# ukol 7 ------
dny <- c("po", "ut", "st", "ct", "pa", "so", "ne")
kroky <- c(6200, 4800, 9300, 5900, 12300, 2700, NA)
names(kroky) <- dny   # co udelalao to kroky <- names(dny)
length(kroky) 


# uloha 8 ------
kroky["so":"ne"] #?????????????????
kroky[-1]
kroky[2:4]
kroky[length(kroky)]



# uloha 9------
kroky[kroky > 8000]
names(kroky[kroky > 8000 & !is.na(kroky)]) # to pak royepsat 

length(names(kroky[kroky > 8000 & !is.na(kroky)]))


#uloha 10 -----
prumer <- mean(kroky, na.rm =TRUE)
sum(is.na(kroky))
which(is.na(kroky)) # i s dnem 

#uloha 11 -----

kroky[is.na(kroky)] <- round(prumer)
kroky


#uloha 12 -----
cil <- rep(c(8000, 12000), times = c(5, 2))
rozdil <- kroky - cil 
rozdil
splneno <- c(kroky - cil >0)
kroky[-1] %in% splneno #????????????????

#uloha 13--------
km <- round(kroky * 0.75, 2)
sum(km)
# R nasoby vektory po prvcich takze 0.75 se postupne vynaobim s kazdym prvkem v krocich 

#uloha14----

names(km)[which.max(km)]
names(km)[which.min(km)]  # toto neamma tuseni jak funguje 

names(km)[which.range(km)] # toto bz bzlo cool kdzbz fungovao 


sort(kroky, decreasing = TRUE)
head(sort(kroky, decreasing = TRUE), 3) #? to nevim jak se stalo udelalt to internet lol 


#uloha 15 ------

cumsum(kroky) * 0.65


