# ============================================================================
# 4ST110 - Uvod do programovani v R
# Cviceni 2: Vektory a funkce
# ============================================================================
#
# JAK S TIMTO SKRIPTEM PRACOVAT
#
#  - Tenhle soubor si ulozte do sve slozky pro predmet a pracujte primo v nem.
#  - Tam, kde je napsano  # >>>  je ukol pro vas - dopiste kod POD ten radek.
#  - Radek spustite klavesovou zkratkou  Ctrl + Enter  (Mac: Cmd + Enter).
#
# ============================================================================


# 1. Ctyri zpusoby, jak vyrobit vektor ---------------------------------------

# Vektor je rada hodnot STEJNEHO typu. Zakladni stavebni kamen celeho R.

# (a) c() - "combine", vyjmenujeme prvky rucne
teploty <- c(12.5, 14.0, 9.8, 15.2, 11.1)
teploty

# (b) dvojtecka - posloupnost celych cisel po jedne
1:10
10:1        # funguje i pozpatku
-3:3

# (c) seq() - posloupnost s libovolnym krokem nebo o zadane delce
seq(from = 0, to = 100, by = 25)    # krok 25
seq(0, 1, by = 0.1)                 # desetinny krok
seq(0, 1, length.out = 5)           # "chci presne 5 hodnot, krok si dopocti"

# (d) rep() - opakovani
rep(0, times = 5)                   # 0 0 0 0 0
rep(c(1, 2), times = 3)             # 1 2 1 2 1 2   - opakuje CELY vektor
rep(c(1, 2), each = 3)              # 1 1 1 2 2 2   - opakuje KAZDY prvek

# >>> UKOL 1: Vytvorte vektor  roky  s hodnotami od 2015 do 2026.
#     Kolik ma prvku? Overte funkci length().
roky <- c(2015:2026)
length(roky) 

# >>> UKOL 2: Vytvorte vektor  desitky , ktery obsahuje cisla 10, 20, ..., 100.
#     Pouzijte seq(). Pak totez pomoci dvojtecky a nasobeni - jde to?
desitky <- seq(from = 10, to = 100, by = 10)
desitky_2 <- (1:10) * 10

# >>> UKOL 3: Vytvorte vektor  hodnoceni , ktery bude obsahovat
#     tri jednicky, tri dvojky a tri trojky (v tomhle poradi).
hodnoceni <- rep(c(1, 2, 3), each = 3)


# 2. Pojmenovany vektor -------------------------------------------------------

# Prvkum vektoru se daji dat jmena. Hodi se to, kdyz data neco znamenaji.

trzby <- c(leden = 120, unor = 95, brezen = 143)
trzby
names(trzby)             # vypise jmena

# Jmena se daji pridat i dodatecne:
teploty                  # zatim bez jmen
names(teploty) <- c("po", "ut", "st", "ct", "pa")
teploty

# A zase odebrat:
# names(teploty) <- NULL

# >>> UKOL 4: Vytvorte pojmenovany vektor  vyska  se svou vyskou
#     a vyskami dvou spoluzaku. Jmena prvku = krestni jmena.
vyska <- c(175, 181, 184)
names(vyska) <- c("Jan", "Roman", "Petr")


# 3. Vyber prvku (indexace) ---------------------------------------------------

# (a) podle POZICE - R indexuje od 1, ne od 0
teploty[1]
teploty[c(1, 3, 5)]
teploty[2:4]

# (b) ZAPORNY index = "vsechno krome"
teploty[-1]          # vsechno krome prvniho
teploty[-c(1, 2)]    # vsechno krome prvnich dvou

# POZOR: kladne a zaporne indexy se michat nedaji.
# teploty[c(-1, 2)]  # odkomentujte a spustte - co rika hlaska?

# (c) LOGICKY vektor - vybere prvky, kde je TRUE
teploty > 12                  # vrati vektor TRUE/FALSE stejne delky
teploty[teploty > 12]         # a tohle vybere ty prvky
# Precteno nahlas: "z teplot vyber ty, ktere jsou vetsi nez 12".

# (d) podle JMENA
teploty["st"]
teploty[c("po", "pa")]

# >>> UKOL 5: Z vektoru  roky  vyberte prvni tri prvky.
roky[1:3]


# >>> UKOL 6: Z vektoru  roky  vyberte vsechny prvky KROME posledniho.
#     (Nepiste natvrdo -12; pouzijte length()).
length(roky)
roky[1:10]


# >>> UKOL 7: Z vektoru  teploty  vyberte ty dny, kdy bylo mene nez 12 stupnu.
names(teploty[teploty > 12])


# >>> UKOL 8: Kolik takovych dnu bylo? (Vyjdete z vysledku ukolu 7.)
length(names(teploty[teploty > 12]))


# Zapis do vektoru funguje stejne - jen je prirazeni na druhou stranu:
teploty[1] <- 13.0
teploty
teploty[teploty < 10] <- 10      # "vsechno pod 10 srovnej na 10"
teploty

# >>> UKOL 9: Ve vektoru  hodnoceni  nahradte vsechny trojky dvojkami.
hodnoceni[hodnoceni > 2] <- 2
hodnoceni

hodnoceni[hodnoceni == 2] <- 2
hodnoceni

# 4. Vektorove operace a recyklace -------------------------------------------

# Operace se provadi PO PRVCICH - zadny cyklus nepotrebujeme:
ceny <- c(100, 250, 80, 340)
ceny * 1.21            # DPH na kazdou cenu
ceny - 10
ceny > 100

# Dva vektory stejne delky se scitaji po prvcich:
a <- c(1, 2, 3, 4)
b <- c(10, 20, 30, 40)
a + b
a * b

# A ted ta zajimava cast - co kdyz maji ruznou delku?
a + c(100, 200)        # 101 202 103 204
# Kratsi vektor se ZOPAKUJE (recykluje), dokud nedojde ten delsi.
# Proto taky funguje  ceny * 1.21  - 1.21 je vektor delky 1.

# Kdyz delka delsiho neni nasobkem kratsiho, R to udela, ale varuje:
a + c(1, 2, 3)         # varovani "longer object length is not a multiple..."

# >>> UKOL 10: Mate ceny v korunach:  c(250, 180, 990, 1250) .
#     Prevedte je na eura kurzem 25.2 a zaokrouhlete na dve desetinna mista.
ceny_kc <- c(250, 180, 990, 1250)
ceny_eur <- round(ceny_kc / 25.2, 2)
ceny_eur


# >>> UKOL 11: Vytvorte vektor  mesice <- 1:12  a pomoci recyklace
#     z nej udelejte vektor, kde budou lichy mesic zaporny a sudy kladny.
mesice <- 1:12
mesice * c(-1, 1)           
 
# 5. Vektor unese jen jeden typ: coercion ------------------------------------

# Minule jsme to videli letmo. Ted poradne.

c(1, 2, 3)                 # numeric
c(TRUE, FALSE, TRUE)       # logical
c("a", "b")                # character

# Co kdyz michame?
class(c(TRUE, 1L))         # ?
class(c(1L, 2.5))          # ?
class(c(2.5, "text"))      # ?

# Hierarchie:
#     logical  <  integer  <  double (numeric)  <  character
# R vzdy povysi vsechno na ten nejobecnejsi typ, ktery se ve vektoru objevi.

# Prakticky dusledek, ktery se hodi:
sum(c(TRUE, FALSE, TRUE, TRUE))    # TRUE se chova jako 1, FALSE jako 0 -> 3
mean(c(TRUE, FALSE, TRUE, TRUE))   # podil TRUE -> 0.75 

# >>> UKOL 12: Bez spousteni urcete tridu kazdeho z techto vektoru.
#      Pak overte funkci class().
class(c(1, TRUE))   # bude double
class(c("1", TRUE))    # bude character
class(c(1L, TRUE, 2.5))       # bude numeric

# >>> UKOL 13: Kolik dnu ve vektoru  teploty  melo vice nez 11 stupnu?
#      Vyreste to JEDNIM vyrazem.
names(teploty[teploty > 11])
length(names(teploty[teploty > 11]))

# 6. Chybejici hodnoty: NA ----------------------------------------------------

mereni <- c(21.5, 19.8, NA, 22.1, NA, 20.4)
mereni
length(mereni)        # NA se pocita jako plnohodnotny prvek

# NA je "nakazlive" - cokoliv s NA vyjde NA:
mereni + 1
mean(mereni)          # NA !

# Reseni: argument na.rm = TRUE ("remove NA")
mean(mereni, na.rm = TRUE)
sum(mereni, na.rm = TRUE)

# Jak NA najit? POZOR - tohle NEFUNGUJE:
mereni == NA          # vrati same NA, ne TRUE/FALSE

# Spravne je funkce is.na():
is.na(mereni)
sum(is.na(mereni))            # kolik chybi
which(is.na(mereni))          # na kterych pozicich
mereni[!is.na(mereni)]        # vektor bez chybejicich hodnot

# >>> UKOL 14: Vytvorte vektor  znamky <- c(1, 2, NA, 3, 1, NA, 2) .
#      Spoctete prumer bez chybejicich hodnot a zjistete,
#      kolik hodnot chybi.
znamky <- c(1, 2, NA, 3, 1, NA, 2)
mean(znamky, na.rm = TRUE)



# >>> UKOL 15: Vytvorte z vektoru znamky  novy vektor  znamky_ok , ktery
#      neobsahuje zadne NA. Overte jeho delku.
znamky_ok <- znamky[!is.na(znamky)]
length(znamky_ok) 

# 7. Uzitecne funkce nad vektory ---------------------------------------------

x <- c(4, 8, 45, 16, 23, 42)

# Souhrny:
sum(x); mean(x); median(x)
min(x); max(x)
range(x)              # minimum a maximum najednou
length(x)
round(mean(x), 1)
cumsum(x)             # kumulativni (postupny) soucet

# Razeni:
sort(x)                       # vzestupne
cumsum(sort(x))               # kombinace funkci
sort(x, decreasing = TRUE)    # sestupne
rev(x)                        # obraceni poradi (NE razeni!)

# order() vraci POZICE, ne hodnoty - vypada divne, ale je klicove
order(x)                      # "na kterou pozici sahnout, abych radil"
x[order(x)]                   # totez co sort(x)

# Kde neco je:
which(x > 15)                 # pozice prvku vetsich nez 15
which.max(x)                  # pozice maxima
which.min(x)                  # pozice minima
x[which.max(x)]               # hodnota maxima (= max(x))

# Logicke souhrny:
any(x > 40)                   # je aspon jeden vetsi nez 40?
all(x > 3)                    # jsou VSECHNY vetsi nez 3?

# Unikatni hodnoty a jejich pocty:
barvy <- c("modra", "cervena", "modra", "zelena", "modra")
unique(barvy)
table(barvy)                  # cetnostni tabulka - vratime se k ni v T04

# >>> UKOL 16: Z vektoru  teploty  zjistete: prumer, minimum, maximum
#      a den, kdy bylo nejtepleji (jmeno prvku, ne cislo pozice.)
mean(teploty)
max(teploty)
max(teploty(name)) #???????????
names(which.max(teploty))
min(teploty)
names(which.min(teploty))


# >>> UKOL 17: Seradte vektor  x  sestupne. Pak vypiste tri nejvetsi hodnoty.
sort(x, decreasing = TRUE)
sort(x, decreasing = TRUE) [1:3]

# >>> UKOL 18: Overte jednim vyrazem, jestli jsou VSECHNY teploty kladne.
#      A jestli byl aspon jeden den nad 14 stupnu.
c(all(teploty > 0), any(teploty > 14))

# 8. Operator %in% ------------------------------------------------------------

# Otazka "je tahle hodnota ve vektoru?" se resi operatorem %in% :
2 %in% c(1, 2, 3)               # TRUE
5 %in% c(1, 2, 3)               # FALSE

# Funguje i po prvcich - testuje kazdy prvek levy strany:
c(1, 5, 3) %in% c(1, 2, 3)      # TRUE FALSE TRUE

# Typicke pouziti - filtr:
mesta <- c("Praha", "Brno", "Plzen", "Ostrava", "Liberec")
velka <- c("Praha", "Brno", "Ostrava")
mesta %in% velka
mesta[mesta %in% velka]
mesta[!(mesta %in% velka)]      # ta zbyla

# >>> UKOL 19: Mate vektor  cisla <- c(3, 7, 12, 19, 25, 31) .
#      Zjistete, ktera z nich jsou prvocisla mensi nez 20,
#      tedy ktera lezi v c(2, 3, 5, 7, 11, 13, 17, 19).
cisla <- c(3, 7, 12, 19, 25, 31)
prvo_cisa_pod <- c(2, 3, 5, 7, 11, 13, 17, 19)
cisla[cisla %in% prvo_cisa_pod]

# 9. Funkce a jejich argumenty poradne ---------------------------------------

# (a) POZICNE - podle poradi v definici funkce
seq(1, 10, 2)

# (b) JMENNE - explicitne "argument = hodnota"
seq(from = 1, to = 10, by = 2)

# Kdyz jmenujeme, na poradi nezalezi:
seq(by = 2, to = 10, from = 1)

# Da se to michat - pozicni argumenty se doplnuji zleva:
seq(1, 10, by = 2)

# (c) VYCHOZI HODNOTY - argument, ktery nemusite zadat
round(3.14159)          # digits ma vychozi hodnotu 0
round(3.14159, 2)
mean(c(1, 2, NA))       # na.rm ma vychozi hodnotu FALSE
mean(c(1, 2, NA), na.rm = TRUE)

# Jak zjistite, co ma funkce za argumenty a jake maji vychozi hodnoty?
args(seq)
?seq
# V napovede ctete sekci Usage - tam je videt vse:
#   seq(from = 1, to = 1, by = ..., length.out = NULL, ...)

# (d) Tri tecky  ...  - "a cokoliv dalsiho"
# Nektere funkce maji v Usage tri tecky. Znamena to "sem muzete
# dat libovolny pocet dalsich argumentu". Napr. c() nebo sum().
sum(1, 2, 3, 4, 5)
 
# >>> UKOL 20: Podivejte se do napovedy k funkci  sort() .
#      Kolik ma argumentu, ktery je povinny a ktery ma vychozi hodnotu?
#      Seradte vektor  x  sestupne dvema ruznymi zapisy (pozicne i jmenne).
help(sort)
# x a decreasing
# x je povinne a decreasing ma vychozi hodnotu 
sort(x, TRUE)                  # by position: decreasing is the 2nd argument
sort(x, decreasing = TRUE)
# >>> UKOL 21: Najdete v napovede funkce  round() , co presne dela
#      round(2.5) a round(3.5). Spustte to. Prekvapilo vas to?
#      (Hint: hledejte v napovede slovo "rounding".)
help(round)

# 10. Co si odnest ------------------------------------------------------------

# - Vektor = rada hodnot JEDNOHO typu. Indexuje se od 1.
# - Ctyri zpusoby vyberu: pozice, zaporna pozice, logicky vektor, jmeno.
#   Logicky vektor je ten nejsilnejsi - naucte se ho.
# - Operace jdou po prvcich, kratsi vektor se recykluje.
# - NA je nakazlive. Pomaha  na.rm = TRUE  a  is.na() . NIKDY ne  == NA .
# - Argumenty jdou zadat pozicne i jmenne. Jmenne je citelnejsi.
#
# DOMA:
#  - Projdete si skript znovu a spustte ho odshora dolu.
#  - DataCamp: Introduction to R, kapitola 2 (Vectors).
#
# Priste: matice a pole - vektor, ktery ma radky a sloupce.
#         Take se zadava PRVNI DOMACI UKOL.



#doplneni----

