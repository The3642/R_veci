# Cast A ====
## Uloha 1 ----

den_nar <- 23
mesic_nar <- 1
rok_nar <- 2007

pocet_osob <- 3L
class(pocet_osob)
typeof(pocet_osob)

pokus <- 4 
class(pokus)
typeof(pokus)

# pocet osob je int a pokus je numeric a double, diky L se to ulozi jako int 

## Uloha 2 ----

prijmeni <- "papacek"
oblibene_cislo <- 6

#prijmeni * 2 #Error in prijmeni * 2 : non-numeric argument to binary operator
cislo_textem <- "12"

as.numeric(cislo_textem) + oblibene_cislo

c(oblibene_cislo, TRUE, prijmeni)
# cahracter díky logical → integer → double → character
typeof(c(oblibene_cislo, TRUE, prijmeni))

## Uloha 3 ----

osobni_klic <- den_nar * mesic_nar + oblibene_cislo

rok_nar %/% 100 
rok_nar %% 100
##  7 %/% 3 # celočíselné dělení -> 2    7 %% 3 # zbytek po dělení -> 1

## Uloha 4 ----

help(round)
# argumetny: x, digits   vychozi je digits s 0 

round(osobni_klic/7, 2)

help(log)
log(x = osobni_klic, base = den_nar)
log(x = osobni_klic, base = mesic_nar + 1) 
# nechapu co chce s tm mesi c naroteni uplne

## Uloha 5 ----

pocet_hodinek <- NA 
class(pocet_hodinek)  #logical

1/0
0/0
# 1/0 vraci Inf a 0/0 NaN 
# deleni jednicku nulou je Inf protoze s mensim jmenovatelem roste hodnota
# deleni nuly nulou nejde

pocet_hodinek + 1
pocet_hodinek == NA
# nevim cemu se rovna takze nemuze mit odpoved TRUE or FALSE ale pouze NA 

is.na(pocet_hodinek) # spravne

## Uloha 6 ----
osobni_klic > 20 & pocet_osob < 10 

oblibene_cislo %% 2 == 0 | rok_nar > 2005

ls() 
# cislo_textem"   "den_nar"        "mesic_nar"      "oblibene_cislo" "osobni_klic"   
# "pocet_hodinek"  "pocet_osob"     "pokus"          "prijmeni"       "rok_nar"


# Cast B ====

## Uloha 7 ----

dny <- c("po", "ut", "st", "ct", "pa", "so", "ne")
kroky <- c(6200, 4800, 9300, 5900, 12300, 2700, NA)

names(kroky) <- dny
length(kroky)

## Uloha 8 ----

kroky[c("so","ne")]
kroky[-1]
kroky[2:4]
kroky[length(kroky)]

## Uloha 9 ----

names(kroky[kroky > 8000 & !is.na(kroky)]) 

length(names(kroky[kroky > 8000 & !is.na(kroky)]))   

## Uloha 10 ----

prumer <- mean(kroky, na.rm = TRUE)

which(is.na(kroky))  # kde je NA 

## Uloha 11 ----

kroky[is.na(kroky)] <- round(prumer)  # nevim jak toto funguje 
kroky

which(is.na(kroky))
any(is.na(kroky))

## Uloha 12 ----

cil <- rep(c(8000, 12000), times = c(5, 2))  

rozdil <- kroky - cil

length((rozdil[rozdil > 0]))  # kolik dnu jsem splnil

splneno <- names(rozdil[rozdil > 0])

"ne" %in% splneno

## Uloha 13 ----

km <- round(kroky * 0.75 / 1000, 2)
# cyklus neni potreba protoze se provede v tom vektoru ta operace s kazdym prvkem sama

sum(km)

## Uloha 14 ----

names(km)[which.max(km)]  

names(km)[which.min(km)] 


sort(kroky, decreasing = TRUE)

sort(kroky, decreasing = TRUE)[1:3]

## Uloha 15 ----

names(kroky)[which(cumsum(kroky) >= sum(kroky) * 0.65)[1]] # co to je toto ???????????

# Cast C =====

## Uloha 16 ----

### a ----

kroky2 <- round(kroky + (oblibene_cislo / 100 * kroky))
               
kroky14 <- c(kroky, kroky2)

names(kroky14) <- paste0(rep(dny, 2), rep(c(1, 2), each = 7)) #????????????

kroky14["st2"] <- 1500


### b ----

zakladni <- round(kroky14%/%1000)

vahy <- c(1, 1, 1, 1, 1, 2, 2)

vazene <- vahy * zakladni
# 14 je nasobek 7 kaye s vsecnz cisla postupne vynasobi

### c  ----

body<- vazene + (kroky14 >= 10000) * 5 #???????

body[kroky14 < 3000] <- 0

### d  ----

celkem <- sum(body)
celkem1 <- sum(body[1:7])
celkem2 <- sum(body[8:14])
celkem1 > celkem2

names(body)[which.max(body)]
names(sort(body, decreasing = TRUE))[1]  # nevim nevim 

### e  ----

hranice <- c(bronz = 100, stribro = 140, zlato = 180)

names(hranice[celkem >= hranice])  

names(which.max(hranice[celkem >= hranice]))#???????


### f  ----

names(body)[which(cumsum(body) >= 1000)[1]]

prumer_kroku <- round(mean(kroky14))

zaklad_den <- prumer_kroku %/% 1000
bonus_den <- (prumer_kroku >= 10000) * 5

dalsi_dny <- 1:1000

vikend <- dalsi_dny %% 7 == 6 | dalsi_dny %% 7 == 0

dalsi_body <- (zaklad_den * (1 + vikend) + bonus_den) *
  (prumer_kroku >= 3000)

soucet <- celkem + cumsum(dalsi_body)

den <- which(soucet >= 1000)[1]

tyden <- (14 + den - 1) %/% 7 + 1
den_v_tydnu <- dny[(14 + den - 1) %% 7 + 1]

paste0(den_v_tydnu, tyden)




#Postupujte tak, že spočítáte průměrný denní počet kroků za celých uběhlých čtrnáct dní 
#(a zaokrouhlete jej na celé číslo), a za předpokladu, že počínaje patnáctým dnem nachodíte denně vždy přesně tento počet kroků 
#a soutěž trvá libovolně dlouho, odhadněte, kolikátý den kterého týdne poprvé na platinovou medaili dosáhnete.

round(mean(kroky14))

### g  ----

sum(kroky14 %/% 1000)
celkem - sum(kroky14 %/% 1000)


