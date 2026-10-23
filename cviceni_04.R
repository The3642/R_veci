# ============================================================================
# 4ST110 - Uvod do programovani v R
# Cviceni 4: data.frame, listy, faktory a tabulky
# ============================================================================
#
# JAK S TIMTO SKRIPTEM PRACOVAT
#
#  - Tenhle soubor si ulozte do sve slozky pro predmet a pracujte primo v nem.
#  - Tam, kde je napsano  # >>>  je ukol pro vas - dopiste kod POD ten radek.
#  - Radek spustite klavesovou zkratkou  Ctrl + Enter  (Mac: Cmd + Enter).
#  - Skript jde presne podle prezentace: cislo sekce (1, 2, ...) najdete
#    na slajdu vpravo nahore jako "skript 1", "skript 2", ...
#    Ukoly maji stejna cisla jako na slajdech "Zkuste sami".
#
# Matice unese jen JEDEN typ dat - kdyz do ni pridate
# text, cisla se promeni v text. Realna data ale vypadaji jinak: jmeno,
# vek, mzda, pohlavi, datum. Na to jsou LISTY a DATA.FRAME.
#
# ============================================================================


# 1. Proc nestaci matice ------------------------------------------------------

matrix(c("Praha", 1300000, "Brno", 380000), nrow = 2, byrow = TRUE)

# Vsimnete si uvozovek u cisel. Matice vsechno prevedla na text (coercion
# z T01). S takovym objektem uz se neda pocitat.
#
# R ma dve struktury, ktere ruzne typy unesou:
#   LIST       - libovolne prvky, libovolne delky, libovolne typy
#   DATA.FRAME - tabulka: sloupce ruznych typu, ale VSECHNY STEJNE DLOUHE


# 2. List ---------------------------------------------------------------------

list("Novak", 21, c(1, 2, 3), TRUE)   # bez jmen -> [[1]], [[2]], ...

# Pojmenovane prvky se pouzivaji skoro vzdycky, protoze se v tom da vyznat:
student <- list(prijmeni = "Novak", vek = 21,
                znamky = c(1, 2, 3), aktivni = TRUE)
student
length(student)   # 4
names(student)    # "prijmeni" "vek" "znamky" "aktivni"
str(student)      # <- tohle delejte u kazdeho noveho objektu

# str() je nejuzitecnejsi funkce dnesni hodiny. U cizich dat je to
# prvni vec, kterou napisete.


# 3. Indexace: [ ] vs. [[ ]] vs. $ --------------------------------------------

# List je komoda se supliky:
#   [ ]   - vytahnete list (cely suplik i s komodou)
#   [[ ]] - sahnete dovnitr a vytahnete OBSAH
#   $     - totez co [[ ]], jen pohodlneji pres jmeno

student[2]      # LIST o jednom prvku
student[[2]]    # OBSAH prvku -> 21
student$vek     # totez, pres jmeno

class(student[2])     # "list"
class(student[[2]])   # "numeric"

student[["vek"]]      # se jmenem jde oboji
student["vek"]
student[c(1, 2)]      # vic prvku -> list

student[[2]] + 1   # 22
# student[2] + 1   # odkomentujte, spustte a prectete si hlasku

# Kdyz neco nefunguje, dejte na to class(). Skoro vzdycky je to tohle.

# >>> UKOL 1: Vytvorte list  predmet  se ctyrmi pojmenovanymi prvky:
#     kod (text "4ST110"), kredity (cislo 5), temata (vektor tri textu)
#     a povinny (TRUE). Prohlednete si ho funkci str().


# >>> UKOL 2: Vypiste pocet kreditu tak, aby vysledek bylo CISLO, ne list.
#     Overte to funkci class().


# >>> UKOL 3: Vypiste druhe tema z vektoru temat. Potrebujete dva kroky
#     indexace za sebou.


# 4. Pridani, odebrani, vnoreni -----------------------------------------------

student$mesto <- "Praha"     # pridani = prirazeni do noveho jmena
str(student)
student$mesto <- NULL        # ODEBRANI prvku
student$mesto <- NA          # NE odebrani - jen "nevim, co tam je"
str(student)                 # mesto tam porad je

# NULL = policko NEEXISTUJE, NA = policko existuje, ale nevime, co v nem je.

# Prvek listu muze byt zase list - tak vypada odpoved webove sluzby
# i vysledek testu, regrese nebo ANOVy:
skupina <- list(
  nazev    = "St 9:15",
  ucitel   = list(prijmeni = "Seif", email = "lubomir.seif@vse.cz"),
  studenti = list(list(prijmeni = "Novak",   vek = 21),
                  list(prijmeni = "Svoboda", vek = 20))
)
str(skupina)
skupina$ucitel$email            # retezime dolary
skupina$studenti[[1]]$prijmeni  # prvni student, jeho prijmeni

vysledek <- t.test(c(4.9, 5.1, 5.0, 5.3, 4.8), mu = 5)
class(vysledek)                 # "htest" - uvnitr je to list
str(vysledek, max.level = 1)    # max.level omezi hloubku vypisu
vysledek$p.value                # 0.8276

# >>> UKOL 4: Pridejte do listu  predmet  prvek  garant  s prijmenim garanta
#     predmetu. Pak prvek  povinny  uplne odeberte.


# >>> UKOL 5: Vypiste vek druheho studenta ze  skupina .


# >>> UKOL 6 (pokud zbyde cas, jinak doma): Pridejte do skupiny tretiho
#     studenta s prijmenim "Dvorak" a vekem 22.
#     Hint: skupina$studenti[[3]] <- list(...)


# 5. data.frame - tabulka, ktera unese vsechno --------------------------------

prodejny <- data.frame(mesto    = c("Praha", "Brno", "Ostrava", "Plzen"),
                       trzba    = c(1250, 830, 640, 510),
                       zamest   = c(12, 9, 7, 6),
                       otevreno = c(TRUE, TRUE, FALSE, TRUE))
prodejny
is.list(prodejny)   # TRUE       <- je to list sloupcu
length(prodejny)    # 4          <- pocet SLOUPCU, ne radku

# Tri uzitecne prikazy:
str(prodejny)       # typy sloupcu  <- vzdycky jako prvni
summary(prodejny)   # statistiky a pocty NA
head(prodejny)      # jak to vlastne vypada

# Dale:
nrow(prodejny); ncol(prodejny); dim(prodejny)
names(prodejny); rownames(prodejny)
sapply(prodejny, class)   # typ kazdeho sloupce


# 6. Data, ktera mate v R uz ted ----------------------------------------------

head(mtcars)         # 32 aut, 11 cisel
str(iris)            # 150 kosatcu
summary(airquality)  # obsahuje NA
?mtcars              # napoveda k sade

# mtcars     - spotreba a parametry aut, sama cisla
# iris       - rozmery okvetnich listku
# airquality - mereni ovzdusi, obsahuje CHYBEJICI HODNOTY
# Seznam vsech dostupnych sad vypise  data() .


# 7. Indexace: [radek, sloupec] -----------------------------------------------

prodejny[1, ]        # prvni RADEK (zustane data.frame)
prodejny[, 2]        # druhy SLOUPEC -> vektor
prodejny[2, 3]       # jedna bunka
prodejny[-1, ]       # vsechno krome prvniho radku
prodejny[1:2, c("mesto", "trzba")]  # radky i sloupce najednou
prodejny[, "trzba", drop = FALSE]   # at sloupec zustane tabulkou

class(prodejny[1, ])   # "data.frame"
class(prodejny[, 2])   # "numeric"

prodejny$trzba       # tri zapisy tehoz sloupce
prodejny[["trzba"]]
prodejny[, "trzba"]
mean(prodejny$trzba) # 807.5

# Rozdil proti matici: vyber RADKU zustava tabulkou (radek ma ruzne typy,
# vektor by je neunesl), vyber SLOUPCE spadne na vektor. Stejny drop
# jako u matic.

# >>> UKOL 7: Zjistete o sade  airquality : kolik ma radku, kolik sloupcu,
#     jak se sloupce jmenuji a jakeho jsou typu.


# >>> UKOL 8: Vypiste prvnich 10 radku sady  iris  a jeji summary().
#     Ktery sloupec summary() vypise jinak nez ostatni?


# >>> UKOL 9: Z mtcars vypiste sloupec  mpg  a spoctete jeho prumer.


# >>> UKOL 10: Z mtcars vypiste prvnich 5 radku a sloupce mpg, cyl a hp
#      zaroven.


# 8. Vyber podle podminky -----------------------------------------------------

prodejny$trzba > 700                                # logicky vektor
prodejny[prodejny$trzba > 700, ]                    # radky podle podminky
prodejny[prodejny$trzba > 600 & prodejny$otevreno, ]
prodejny[prodejny$mesto %in% c("Praha", "Plzen"), ]
prodejny[prodejny$trzba > 700, c("mesto", "zamest")]

sum(prodejny$trzba > 700)        # kolik jich je, bez vyberu

subset(prodejny, trzba > 700)
subset(prodejny, trzba > 700, select = c(mesto, zamest))

# Bezne chyby - odkomentujte, spustte a porovnejte:
# prodejny[prodejny$trzba > 700]   # bez carky vybira SLOUPCE (tady tise!)
# prodejny[trzba > 700, ]          # bez prodejny$ -> object 'trzba' not found
# Prave proto existuje subset() - uvnitr uz se prodejny$ psat nemusi.

# >>> UKOL 11: Z mtcars vyberte auta, ktera maji vic nez 200 koni (hp).
#      Kolik jich je?


# >>> UKOL 12: Z mtcars vyberte auta se 4 valci (cyl) a mpg vetsim nez 30.
#      Vypiste jen sloupce mpg a wt.


# >>> UKOL 13 (pokud zbyde cas, jinak doma): Ze sady iris vyberte kosatce
#      druhu "virginica", ktere maji Petal.Length vetsi nez 6.
#      Pouzijte subset().   ( = prirazuje, == se pta )


# 9. Pridavani, mazani, razeni ------------------------------------------------

prodejny$na_zamestnance <- prodejny$trzba / prodejny$zamest   # novy sloupec

novy_radek <- data.frame(mesto = "Liberec", trzba = 420, zamest = 5,
                         otevreno = TRUE, na_zamestnance = 420 / 5)
prodejny <- rbind(prodejny, novy_radek)          # novy radek

kody_kraju <- c("PHA", "JHM", "MSK", "PLK", "LBK")
prodejny <- cbind(prodejny, kraj = kody_kraju)   # novy sloupec jinak

prodejny$na_zamestnance <- NULL    # odebrani  <- zase NULL
names(prodejny)[4] <- "provoz"     # prejmenovani sloupce
prodejny

# POZOR: rbind() - pridavany radek musi mit STEJNE sloupce se STEJNYMI jmeny.
#        cbind() - novy sloupec musi mit tolik prvku, kolik ma tabulka
#                  radku - po rbind() uz jich je 5.

# Razeni:
x <- c(30, 10, 20)
sort(x)       # 10 20 30   <- HODNOTY
order(x)      #  2  3  1   <- POZICE
x[order(x)]   # 10 20 30   <- proto se order() strka do zavorek

prodejny[order(prodejny$trzba), ]                     # vzestupne
prodejny[order(-prodejny$trzba), ]                    # sestupne
prodejny[order(prodejny$mesto, decreasing = TRUE), ]  # text: jen decreasing

head(mtcars[order(mtcars$cyl, -mtcars$mpg), c("cyl", "mpg")], 10)  # dva klice

# "sort mi rekne CO, order mi rekne ODKUD."

# >>> UKOL 14: Udelejte si kopii  auta <- mtcars  a pridejte do ni sloupec
#      vykon_na_tunu = hp / wt. Vypiste prvnich 5 radku.


# >>> UKOL 15: Seradte mtcars podle mpg sestupne a vypiste prvnich 5 radku.
#      Ktere auto ma nejnizsi spotrebu?


# >>> UKOL 16 (pokud zbyde cas, jinak doma): Seradte iris podle
#      Sepal.Length vzestupne a vypiste poslednich 5 radku.


# 10. Chybejici hodnoty v tabulce ---------------------------------------------

colSums(is.na(airquality))   # kolik NA je v kazdem sloupci

mean(airquality$Ozone)                  # NA
mean(airquality$Ozone, na.rm = TRUE)    # 42.13

sum(complete.cases(airquality))   # 111 uplnych radku ze 153
cisty <- na.omit(airquality)      # rovnou jen uplne radky
nrow(cisty)                       # 111

# POZOR na chybejici hodnoty v podmince:
nrow(airquality[airquality$Ozone > 100, ])          # 44  <- ???
head(airquality[airquality$Ozone > 100, ])          # radky plne NA
nrow(airquality[which(airquality$Ozone > 100), ])   #  7
nrow(subset(airquality, Ozone > 100))               #  7

# NA > 100 je NA, a NA na miste indexu vyrobi radek plny NA.
# Obrana: which() nebo subset().

# >>> UKOL 17: Kolik radku sady airquality ma chybejici hodnotu ve sloupci
#      Solar.R? A kolik radku je uplnych (bez jedineho NA)?


# >>> UKOL 18: Spoctete prumernou teplotu (Temp) a prumerny ozon (Ozone).
#      U ktereho z nich musite pouzit na.rm = TRUE a proc?


# 11. Dve tabulky do jedne: merge() -------------------------------------------

trzby <- data.frame(mesto = c("Praha", "Brno", "Ostrava", "Plzen"),
                    trzba = c(1250, 830, 640, 510))
kraje <- data.frame(mesto = c("Praha", "Brno", "Ostrava", "Liberec"),
                    kraj  = c("PHA", "JHM", "MSK", "LBK"))

merge(trzby, kraje)                 # 3 radky - jen mesta v OBOU
merge(trzby, kraje, all.x = TRUE)   # 4 radky - Plzen s kraj = NA
merge(trzby, kraje, all = TRUE)     # 5 radku - i Liberec

kraje2 <- kraje
names(kraje2)[1] <- "obec"                           # klic se jmenuje jinak
merge(trzby, kraje2, by.x = "mesto", by.y = "obec")

# Teto operaci se rika JOIN. Vysledek merge() je serazeny podle klice.

obyvatele <- data.frame(mesto    = c("Praha", "Brno", "Ostrava", "Plzen", "Olomouc"),
                        obyv_tis = c(1397, 402, 283, 188, 102))

# >>> UKOL 19: Pripojte tabulku  obyvatele  k tabulce  prodejny  tak, aby
#      ve vysledku zustaly VSECHNY prodejny. Vysledek ulozte do  spojeno .
#      Ktera prodejna nema udaj o poctu obyvatel?


# >>> UKOL 20 (pokud zbyde cas, jinak doma): Do  spojeno  pridejte sloupec
#      trzba_na_obyv = trzba / obyv_tis a seradte tabulku podle nej
#      sestupne. Ktera prodejna ma nejvetsi trzbu v pomeru k velikosti mesta?


# 12. Faktory -----------------------------------------------------------------

# Faktor uklada KATEGORIALNI promennou: pohlavi, kraj, znamku. Navenek
# vidite slova, uvnitr jsou cisla a seznam moznych hodnot (levels).

kody <- c("PHA", "JHM", "PHA", "MSK", "JHM", "PHA")
f <- factor(kody)
f
levels(f)       # "JHM" "MSK" "PHA" <- ABECEDNE
nlevels(f)      # 3
table(f)        # cetnosti
as.integer(f)   # 3 1 3 2 1 3 <- uvnitr KODY
str(f)

f2 <- factor(c("PHA", "PHA"),
             levels = c("PHA", "JHM", "MSK"))
table(f2)       # JHM a MSK maji nulu

class(iris$Species)   # "factor" - proto u nej summary() vypsalo cetnosti

# Poradi urovni a ordered:
vel <- factor(c("mala", "velka", "stredni", "mala", "velka"))
levels(vel)     # abecedne - tady to nahodou vyslo
vel <- factor(vel, levels = c("mala", "stredni", "velka"))
table(vel)      # tabulka i graf respektuji VASE poradi

vel_ord <- factor(c("mala", "velka", "stredni"),
                  levels = c("mala", "stredni", "velka"), ordered = TRUE)
vel_ord
vel_ord[1] < vel_ord[2]   # TRUE
vel[1] < vel[2]           # NA + Warning - obycejny faktor neumi <

# POZOR: preklep v levels tise vyrobi NA. Zadna chyba, zadne varovani.
factor(c("mala", "velka"), levels = c("mala", "VELKA"))   # "mala" NA


# 13. Dve pasti s faktory -----------------------------------------------------

# Faktor na cislo:
roky <- factor(c(2019, 2021, 2020, 2021))
roky
as.numeric(roky)                 # 1 3 2 3 <- KODY!
as.numeric(as.character(roky))   # 2019 2021 2020 2021

# "Pres character, vzdycky pres character."

# Nepouzite urovne - podmnozina si pamatuje vsechny urovne:
maly_iris <- iris[iris$Species != "setosa", ]
table(maly_iris$Species)    # setosa: 0
levels(maly_iris$Species)   # porad 3
maly_iris <- droplevels(maly_iris)
table(maly_iris$Species)    # uz jen 2

# >>> UKOL 21: Vyrobte faktor  den  z c("po", "st", "po", "pa", "st", "po")
#      s urovnemi po, ut, st, ct, pa v tomto poradi. Spoctete cetnosti.
#      Kolik je uterku?


# >>> UKOL 22 (pokud zbyde cas, jinak doma): Vyrobte ORDERED faktor  znamka
#      z c("C", "A", "B", "A", "D") s poradim A < B < C < D. Overte,
#      jestli je prvni znamka horsi nez druha.


# >>> UKOL 23: Vyrobte faktor  cena  z c(199, 89, 199, 450) a spoctete
#      prumernou cenu spravne. Kolik by vam vyslo spatne?


# >>> UKOL 24 (pokud zbyde cas, jinak doma): V tabulce  prodejny  prevedte
#      sloupec  kraj  na faktor. Pak vyberte prodejny s trzbou nad 500
#      a zbavte se nepouzitych urovni. Ktera uroven zmizela?


# 14. Tabulky cetnosti --------------------------------------------------------

table(mtcars$cyl)                               # 4: 11   6: 7   8: 14
prop.table(table(mtcars$cyl))                   # relativni cetnosti (podily)
round(100 * prop.table(table(mtcars$cyl)), 1)   # 34.4  21.9  43.8  (%)

# Kontingencni tabulka - dve promenne najednou:
tab <- table(valce = mtcars$cyl,
             prevodovka = mtcars$am)
tab
prop.table(tab)               # z celku
prop.table(tab, margin = 1)   # po RADCICH
prop.table(tab, margin = 2)   # po SLOUPCICH
rowSums(prop.table(tab, 1))   # 1 1 1 <- overeni
addmargins(tab)               # soucty na okraje
round(100 * prop.table(tab, 1), 1)

# margin = 1 znamena "kazdy RADEK dava dohromady 100 %".
# Stejna logika jako MARGIN u apply() z minula.


# 15. cut() - z cisla kategorie -----------------------------------------------

spotreba <- cut(mtcars$mpg, breaks = c(0, 15, 20, 25, 40))
table(spotreba)      # intervaly (0,15], (15,20], ... zleva otevrene
spotreba <- cut(mtcars$mpg, breaks = c(0, 15, 20, 25, 40),
                labels = c("velka", "stredni", "mala", "velmi mala"))
table(spotreba)
class(spotreba)      # "factor"  <- cut() vraci FAKTOR
table(spotreba, mtcars$cyl)

# POZOR: hranice musi pokryt CELY rozsah, jinak vzniknou tise NA:
table(cut(mtcars$mpg, breaks = c(15, 20, 25)), useNA = "always")  # 12x NA
# Jistota: breaks = c(-Inf, 15, 20, 25, Inf)

# >>> UKOL 25: Spoctete absolutni i relativni cetnosti promenne  gear
#      v mtcars. Kolik procent aut ma 4 prevodove stupne?


# >>> UKOL 26: Sestavte kontingencni tabulku cyl x gear v mtcars, pridejte
#      souctove okraje a spoctete radkove procentni podily.


# >>> UKOL 27: Rozdelte hmotnost aut (wt) do kategorii "lehke", "stredni",
#      "tezke" podle hranic 0, 2.5, 3.5, 6. Sestavte kontingencni tabulku
#      teto kategorie a poctu valcu.


# >>> UKOL 28 (doma): Do kopie iris pridejte sloupec  velikost :
#      Sepal.Length do 5.5 "mala", do 6.5 "stredni", jinak "velka".
#      Sestavte tabulku velikost x Species a radkove procentni podily.


# 16. Co si odnest ------------------------------------------------------------

# 1. str() u kazde nove tabulky. Vzdycky.
# 2. [ ] vraci list, [[ ]] a $ vraceji obsah.
# 3. Pozor na carku: df[podminka, ] , ne df[podminka].
# 4. Podminka s NA vyrobi radky plne NA. Obrana: subset() nebo which().
# 5. Faktor na cislo jedine pres as.numeric(as.character(x)).
#
# PROCVICIT: DataCamp: Introduction to R, kapitoly 4 (Factors),
#            5 (Data frames) a 6 (Lists).
#
# PRISTE: Obhajoby DU1. Pak si vyrobite vlastni tabulku v Excelu
#         a nactete ji do R ve ctyrech formatech.