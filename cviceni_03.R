# ============================================================================
# 4ST110 - Uvod do programovani v R
# Cviceni 3: Matice a pole
# ============================================================================
#
# JAK S TIMTO SKRIPTEM PRACOVAT
#
#  - Tenhle soubor si ulozte do sve slozky pro predmet a pracujte primo v nem.
#  - Tam, kde je napsano  # >>>  je ukol pro vas - dopiste kod POD ten radek.
#  - Radek spustite klavesovou zkratkou  Ctrl + Enter  (Mac: Cmd + Enter).
#
# NAVAZUJEME NA T02. Matice je vektor, ktery ma navic radky a sloupce.
# Vsechno, co umite s vektorem (indexace, logicke vybery, NA), plati i tady.
#
# NA KONCI HODINY se zadava PRVNI DOMACI UKOL (pokryva T01-T02).
#
# ============================================================================


# 1. Jak vyrobit matici -------------------------------------------------------

# Matice vznikne tak, ze vektoru rekneme, kolik ma mit radku a sloupcu:

m <- matrix(1:6, nrow = 2)
m

# Vsimnete si, jak se cisla plni: PO SLOUPCICH (shora dolu, pak dalsi sloupec).
# Kdyz chcete plnit po radcich, reknete si o to:
matrix(1:6, nrow = 2, byrow = TRUE)

# Staci zadat JEDEN z rozmeru, druhy si R dopocita:
matrix(1:6, nrow = 2)
matrix(1:6, ncol = 2)
matrix(1:6, nrow = 3, ncol = 2)   # muzete i oba, ale musi to sedet

# Matice z jedne hodnoty (casto jako "prazdna" matice na naplneni):
matrix(0, nrow = 3, ncol = 3)
matrix(NA, nrow = 2, ncol = 4)

# >>> UKOL 1: Vytvorte matici  A  o rozmerech 3 x 4, ktera obsahuje
#     cisla 1 az 12 doplnena PO RADCICH.


# >>> UKOL 2: Vytvorte matici  B  o rozmerech 4 x 3, ktera obsahuje
#     stejna cisla, ale doplnena PO SLOUPCICH.


# 2. Rozmery matice -----------------------------------------------------------

dim(m)        # vektor c(pocet_radku, pocet_sloupcu)
nrow(m)       # pocet radku
ncol(m)       # pocet sloupcu
length(m)     # pocet PRVKU celkem - matice je porad vektor!

# dim() jde i nastavit - a tim se z vektoru stane matice:
v <- 1:12
dim(v) <- c(3, 4)
v
class(v)

# recyklace
matrix(1:6, ncol = 3, nrow = 3)

# >>> UKOL 3: Zjistete rozmery matice A a jeji celkovy pocet prvku.
#     Kolik prvku ma matice o rozmerech dim(A)?


# 3. Jmena radku a sloupcu ----------------------------------------------------

prodeje <- matrix(c(120, 95, 143, 110, 88, 150), nrow = 2, byrow = TRUE)
prodeje

rownames(prodeje) <- c("Praha", "Brno")
colnames(prodeje) <- c("leden", "unor", "brezen")
prodeje

# Vsechna jmena najednou:
dimnames(prodeje)

# Jmena jde zadat rovnou pri tvorbe - jako list dvou vektoru:
matrix(1:4, nrow = 2,
       dimnames = list(c("r1", "r2"), c("s1", "s2")))

# >>> UKOL 4: Pojmenujte radky matice A jako "r1", "r2", "r3"
#     a sloupce jako "s1" az "s4". Vytisknete ji.


# 4. Indexace matice ----------------------------------------------------------

# U vektoru byl v hranatych zavorkach jeden index. U matice jsou DVA,
# oddelene carkou:            m[radek, sloupec]
# Pamatovaci pomucka: nejdriv RADEK, pak SLOUPEC. Jako u souradnic v tabulce.

prodeje[1, 2]              # prvni radek, druhy sloupec
prodeje["Brno", "unor"]    # totez pres jmena

# Prazdne misto znamena "vsechno":
prodeje[1, ]               # cely PRVNI RADEK
prodeje[, 2]               # cely DRUHY SLOUPEC
prodeje[, c(1, 3)]         # prvni a treti sloupec

# Zaporne indexy a logicke vektory funguji stejne jako u vektoru:
prodeje[-1, ]              # vsechno krome prvniho radku
prodeje[, prodeje[1, ] > 100]    # sloupce, kde mela Praha vic nez 100

# >>> UKOL 5: Z matice A vypiste druhy radek.


# >>> UKOL 6: Z matice A vypiste treti sloupec.


# >>> UKOL 7: Z matice A vypiste prvek na pozici [2, 3].
#     Pak prvni dva radky a posledni dva sloupce zaroven.


# POZOR - past, kterou musite znat:
prodeje[1, ]               # vypada to jako matice, ale...
class(prodeje[1, ])        # ..."numeric" - je to VEKTOR!
dim(prodeje[1, ])          # NULL - rozmery zmizely

# R totiz z vysledku automaticky "odstrani" rozmer, ktery ma delku 1.
# Rika se tomu DROP. Kdyz to nechcete, reknete  drop = FALSE :
prodeje[1, , drop = FALSE]
class(prodeje[1, , drop = FALSE])
dim(prodeje[1, , drop = FALSE])

# >>> UKOL 8: Vyberte z matice A prvni sloupec tak, aby vysledek zustal
#     matici (a ne vektorem). Overte to funkci dim().


# Zapis do matice funguje stejne jako cteni:
prodeje[1, 1] <- 125
prodeje[2, ] <- c(100, 90, 160)     # cely radek najednou
prodeje


# 5. Skladani matic: rbind() a cbind() ---------------------------------------

# rbind = "row bind", prilepi radek (nebo matici) zespodu
# cbind = "column bind", prilepi sloupec zprava

prodeje2 <- rbind(prodeje, Ostrava = c(70, 65, 80))
prodeje2

prodeje3 <- cbind(prodeje2, duben = c(130, 140, 90))
prodeje3

# Funguje to i na spojeni dvou vektoru do matice:
rbind(1:3, 4:6)
cbind(1:3, 4:6)

# >>> UKOL 9: Pridejte k matici A ctvrty radek s hodnotami 100 az 400
#     (po stovkach). Vysledek ulozte do  A2 .


# >>> UKOL 10: K matici A2 pridejte paty sloupec, ktery bude obsahovat
#     soucet kazdeho radku. (Funkci na soucty radku najdete o kus nize -
#     nebo si ji zkuste najit v napovede sami.)


# 6. Aritmetika: po prvcich vs. maticove nasobeni -----------------------------

X <- matrix(1:4, nrow = 2)
Y <- matrix(c(10, 20, 30, 40), nrow = 2)
X
Y

# Bezne operatory pracuji PO PRVCICH - stejne jako u vektoru:
X + Y
X * Y        # POZOR: tohle NENI maticove nasobeni!
X / Y
X * 2        # skalar se recykluje, jako u vektoru

# Maticove nasobeni ma vlastni operator  %*% :
X %*% Y

# Rozdil je zasadni - porovnejte:
X * Y        # po prvcich
X %*% Y      # radek krat sloupec

# >>> UKOL 11: Spoctete rozdil matic A2[1:3, 1:3] a matice, ktera ma
#     na vsech mistech trojku (rozmer 3 x 3).


# >>> UKOL 12: Overte na papire i v R, ze pro matice obecne
#     NEPLATI  X %*% Y == Y %*% X .


# 7. Klasicke maticove funkce -------------------------------------------------

M <- matrix(c(2, 2, 1, 3), nrow = 2)
M

t(M)          # transpozice - prehodi radky a sloupce
diag(M)       # diagonala matice (jako vektor)
diag(3)       # jednotkova matice 3 x 3 - pozor, jina role stejne funkce!
diag(c(1, 2, 3))   # diagonalni matice ze zadaneho vektoru

det(M)        # determinant
solve(M)      # INVERZNI matice

# Overeni, ze inverze je opravdu inverze:
M %*% solve(M)     # melo by vyjit priblizne jednotkova matice
round(M %*% solve(M), 10)   # zaokrouhleni schova numericke nepresnosti

# solve() umi i resit soustavu rovnic  M x = b :
b <- c(5, 10)
solve(M, b)

# >>> UKOL 13: Overte, ze matice  matrix(c(1, 2, 2, 4), nrow = 2)
#     je singularni (ma nulovy determinant). Pak zkuste spocitat
#     jeji inverzi a prectete si hlasku.


# >>> UKOL 14: Vyreste soustavu:
#        2x +  y = 8
#         x + 3y = 14
#     Sestavte matici soustavy a vektor pravych stran a pouzijte solve().
#     Vysledek overte dosazenim.


# 8. Souhrny po radcich a sloupcich -------------------------------------------

prodeje3

rowSums(prodeje3)     # soucet kazdeho radku
colSums(prodeje3)     # soucet kazdeho sloupce
rowMeans(prodeje3)    # prumer kazdeho radku
colMeans(prodeje3)    # prumer kazdeho sloupce

# Tyhle ctyri funkce jsou rychle a napsane primo v C. Pouzivejte je.

# >>> UKOL 15: Ktere mesto melo nejvyssi celkove trzby?
#     (Hint: rowSums() a which.max() z minule hodiny.)


# >>> UKOL 16: Ktery mesic byl v souctu nejslabsi?


# 9. apply() - kdyz potrebujete neco jineho nez soucet -----------------------

# Co kdyz chcete po radcich MEDIAN? Funkce rowMedians() neexistuje.
# Na to je apply():
#
#     apply(matice, MARGIN, funkce)
#         MARGIN = 1  ->  po RADCICH
#         MARGIN = 2  ->  po SLOUPCICH
#
# Pamatovaci pomucka: 1 = radek, 2 = sloupec. Stejne poradi jako u [i, j].

apply(prodeje3, 1, sum)       # totez co rowSums()
apply(prodeje3, 2, sum)       # totez co colSums()
apply(prodeje3, 1, median)    # tohle uz jinak nejde
apply(prodeje3, 2, max)
apply(prodeje3, 1, range)     # pozor, vraci matici - kazdy vysledek je dvojice

# >>> UKOL 17: Najdete pro kazdy mesic (sloupec) matice prodeje3
#     maximalni a minimalni trzbu.


# >>> UKOL 18: Spoctete pro kazde mesto (radek) smerodatnou odchylku trzeb.
#     (Funkce se jmenuje sd().)

# Rodinu funkci apply/sapply/lapply probereme poradne v T07.
# Dnes ji berte jen jako nastroj, ktery se hodi.


# 10. Pole (array) - matice ve vice rozmerech ---------------------------------

# Matice ma dva rozmery. Pole jich muze mit libovolne mnoho.
# Typicke pouziti: tabulka, ktera se meni v case.

# Prodeje 2 mesta x 3 mesice x 2 roky:
pole <- array(1:12, dim = c(2, 3, 2))
pole

# Cteni: nejdriv se vypise prvni "vrstva" [, , 1], pak druha [, , 2].

dim(pole)
length(pole)

# Indexace ma tolik indexu, kolik ma pole rozmeru:
pole[1, 2, 1]      # mesto 1, mesic 2, rok 1
pole[, , 1]        # cela prvni vrstva - je to matice 2 x 3
pole[1, , ]        # prvni mesto pres vsechny mesice a roky

# Jmena se zadavaji stejne, jen pro vsechny tri rozmery:
dimnames(pole) <- list(c("Praha", "Brno"),
                       c("leden", "unor", "brezen"),
                       c("2025", "2026"))
pole
pole["Brno", "unor", "2026"]

# apply() funguje i na poli - MARGIN pak muze byt i vektor:
apply(pole, 3, sum)          # soucet za kazdy rok
apply(pole, c(1, 3), sum)    # soucet za kazde mesto a rok

# >>> UKOL 19: Z pole  pole  vypiste vsechny hodnoty za rok 2025.
#     Jaky ma vysledek rozmer?


# >>> UKOL 20: Spoctete prumernou trzbu za kazdy mesic pres obe mesta
#     a oba roky. (Hint: apply() s MARGIN = 2.)


# 11. Co si odnest ------------------------------------------------------------

# - Matice = vektor s rozmerem. Plni se po sloupcich, pokud nerekneme jinak.
# - Indexuje se  [radek, sloupec] . Prazdne misto = "vsechno".
# - Vyber jednoho radku vrati VEKTOR. Kdyz to nechcete, drop = FALSE.
# - `*` je po prvcich, `%*%` je maticove nasobeni. Nepletete si je.
# - rowSums/colSums/rowMeans/colMeans na bezne veci, apply() na zbytek.
# - Pole je matice s vic rozmery, funguje uplne stejne.
#
# DOMA:
#  - DOMACI UKOL 1 - zadani najdete v Teams.
#  - DataCamp: Introduction to R, kapitola 3 (Matrices).
#
# Priste: data.frame, listy a faktory - struktury, ktere unesou
#         ruzne typy dat zaroven. A obhajoby DU1.
