# Cast A ====
## Uloha 1 ----

den_nar <- 23
mesic_nar <- 1
rok_nar <- 2007

den_nar 
mesic_nar 
rok_nar 

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

#prijmeni * 2 
#Error in prijmeni * 2 : non-numeric argument to binary operator

cislo_textem <- "12"

as.numeric(cislo_textem) + oblibene_cislo

c(oblibene_cislo, TRUE, prijmeni)
# cahracter diky logical → integer → double → character

class(c(oblibene_cislo, TRUE, prijmeni))

## Uloha 3 ----

osobni_klic <- den_nar * mesic_nar + oblibene_cislo

rok_nar %/% 100 
rok_nar %% 100
#  7 %/% 3 # celociselne deleni -> 2    7 %% 3 # zbytek po deleni -> 1

## Uloha 4 ----

help(round)
# argumetny: x, digits   vychozi je digits s 0 

round(osobni_klic/7, 2)

help(log)
log(x = osobni_klic, base = den_nar)
log(x = osobni_klic, base = 1)
# da Inf protoze jednicka umocnena na cokoliv je vzdy jedna 

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
kroky
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


sum(is.na(kroky))
which(is.na(kroky))  # kde je NA 


## Uloha 11 ----

kroky[is.na(kroky)] <- round(prumer)  
kroky

which(is.na(kroky))
any(is.na(kroky))

## Uloha 12 ----

cil <- rep(c(8000, 12000), times = c(5, 2))  

rozdil <- kroky - cil

length((rozdil[rozdil >= 0]))  # kolik dnu jsem splnil

splneno <- names(rozdil[rozdil >= 0])

"ne" %in% splneno

## Uloha 13 ----

km <- round(kroky * 0.75 / 1000, 2)
# cyklus neni potreba protoze se provede v tom vektoru ta operace s kazdym prvkem pokazde sama

sum(km)

## Uloha 14 ----

names(kroky[which.max(kroky)])  

names(kroky[which.min(kroky)]) 


sort(kroky, decreasing = TRUE)

sort(kroky, decreasing = TRUE)[1:3]

## Uloha 15 ----
soucet <- cumsum(kroky)

names(which(soucet >= sum(kroky) * 0.65))[1]

# Cast C =====

## Uloha 16 ----

### a ----

kroky2 <- round(kroky + (oblibene_cislo / 100 * kroky))
               
kroky14 <- c(kroky, kroky2)

names(kroky14) <- paste0(rep(dny, 2), rep(c(1, 2), each = 7)) 

kroky14["st2"] <- 1500


### b ----

zakladni <- kroky14%/%1000

vahy <- c(1, 1, 1, 1, 1, 2, 2)

vazene <- vahy * zakladni
vazene
# 14 je nasobek 7 takze se vsechny cisla postupne vynasobi 
# kdyby to blyo 5 tak by se to vynasobilo postupne zase ale vyhodilo by to Warning message

### c  ----

body<- vazene + (kroky14 >= 10000) * 5 
body[kroky14 < 3000] <- 0

### d  ----

celkem <- sum(body)
celkem1 <- sum(body[1:7])
celkem2 <- sum(body[8:14])
celkem1 < celkem2

names(body[which.max(body)])

### e  ----

hranice <- c(bronz = 100, stribro = 140, zlato = 180)

names(hranice[celkem >= hranice])  

names(which.max(hranice[celkem >= hranice]))


### f  ----


prumer2 <- round(mean(kroky14))

kroky_dalsi <- rep(prumer2, 500)

kroky_celkem <- c(kroky14, kroky_dalsi)

# body
zakladni_celkem <- kroky_celkem %/% 1000

vahy_celkem <- rep(c(1, 1, 1, 1, 1, 2, 2), length.out = length(kroky_celkem))

vazene_celkem <- vahy_celkem * zakladni_celkem

body_celkem <- vazene_celkem + (kroky_celkem >= 10000) * 5

body_celkem[kroky_celkem < 3000] <- 0


soucet <- cumsum(body_celkem)

# den 1000
den <- which(soucet >= 1000)[1]


tyden <- (den - 1) %/% 7 + 1
den_v_tydnu <- (den - 1) %% 7 + 1


paste0(dny[den_v_tydnu], tyden)



### g  ----

sum(kroky14 %/% 1000)

celkem - sum(kroky14 %/% 1000)
#bez ostatnich pravidel bych mel pouze 84 bodu tedy o 18 mene nez s pravidly


