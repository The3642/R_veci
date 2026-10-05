# ============================================================================
# 4ST110 - Uvod do programovani v R
# Cviceni 1: R-svet a prvni kroky
# ============================================================================
#
# JAK S TIMTO SKRIPTEM PRACOVAT
#
#  - Tenhle soubor si ulozte do sve slozky pro predmet a pracujte primo v nem.
#  - Tam, kde je napsano  # >>>  je ukol pro vas - dopiste kod POD ten radek.
#  - Radek spustite klavesovou zkratkou  Ctrl + Enter  (Mac: Cmd + Enter).
#  - Az budete hotovi, skript si ulozte. Budete se k nemu vracet.
#
# ============================================================================


# 1. Orientace v RStudiu ------------------------------------------------------

# RStudio ma ctyri panely:
#   vlevo nahore  - SKRIPT (tady jste ted)
#   vlevo dole    - KONZOLE (tady se kod spousti a vypisuji vysledky)
#   vpravo nahore - ENVIRONMENT (seznam objektu, ktere existuji)
#   vpravo dole   - soubory, grafy, balicky, napoveda

# DULEZITE: Konzole je "tabule" - po zavreni RStudia je pryc.
#           Skript je "sesit" - ten si ulozite a odevzdavate.
#           Vsechno podstatne patri do skriptu.

# Zkuste si to: napiste do KONZOLE  2 + 2  a stisknete Enter.
# Ted totez ze skriptu - postavte kurzor na radek nize a dejte Ctrl + Enter:

2 + 2


# 2. Prvni objekt -------------------------------------------------------------

# Objekt vytvorime prirazenim. Sipka  <-  se pise zkratkou  Alt + -

x <- 5
x           # vypise hodnotu
print(x)    # totez, jen explicitne

# >>> UKOL 1: Vytvorte objekt  y  s hodnotou 12 a vytisknete ho.
y <- 12
y

# >>> UKOL 2: Vytvorte objekt  soucet , ktery bude obsahovat soucet x a y.
#     Pak ho vytisknete.
soucet <- x + y 

# Pozor na tri zpusoby uziti rovnitka:
x = 5     # prirazeni (funguje, ale konvence je <- )
x == 5    # OTAZKA: rovna se x peti?  -> vrati TRUE / FALSE
x != 5    # OTAZKA: je x ruzne od peti?

# >>> UKOL 3: Zjistete, jestli je y vetsi nez 10. Pak jestli je mensi nez 10.
y  > 10
y  < 10

# Klasicka past - mezera na spatnem miste:
z < - 5   # tohle NENI prirazeni! R to cte jako "je z mensi nez -5"
# Spustte ten radek. Co se stalo? Vznikl objekt z? Podivejte se do Environmentu.


# 3. Pravidla pro nazvy objektu -----------------------------------------------

# R rozlisuje velka a mala pismena:
Mesto <- "Praha"
mesto <- "Brno"
Mesto
mesto
# To jsou DVA ruzne objekty.

# >>> UKOL 4: Spustte  print(MESTO) . Co se stalo? Prectete si hlasku.
#     Co presne vam R rika?

print(MESTO) # objekt MESTO neexistuje, existuje pouze Mesto a mesto 

# Co v nazvech objektu smi a nesmi:
#   ANO:  muj_objekt   mujObjekt   data1   x.y
#   NE:   muj objekt   (mezera)
#   NE:   1data        (zacina cislem)
#   NE:   muj-objekt   (pomlcka = minus)
#   NEDOPORUCENO: nazvy s diakritikou - na jinem pocitaci se rozbiji

# >>> UKOL 5: Vytvorte objekt  pocet_prstu  s poctem prstu vsech osob
#     u vas doma. Pak objekt  pocet_noh  se stejnou logikou.
pocet_prstu <- 20
pocet_prstu_rodina <- 60
pocet_noh <- 2
pocet_noh_rodina <- 6

# 4. Typy dat -----------------------------------------------------------------

# R ma nekolik zakladnich typu. Podivejme se na ne:

a <- 5          # numeric  - realne cislo (i kdyz je to "petka")
b <- 5L         # integer  - cele cislo (pismeno L za cislem)
c_ <- "petka"   # character - text, VZDY v uvozovkach
d <- TRUE       # logical  - pravda / nepravda (TRUE / FALSE, nebo T / F)
e <- 5 + 2i     # complex  - komplexni cislo

# Typ zjistime dvema funkcemi. Zkuste obe na vsech peti objektech:
class(e)
typeof(e)

# >>> UKOL 6: Zjistete class() a typeof() u objektu b.
#     Lisi se? Zkuste vysvetlit proc.
class(b)
typeof(b)
# oba jsou integer 
# nejspise kvuli L za 5


# Text musi byt v uvozovkach. Bez nich R hleda objekt:
"Praha"     # text
Praha     # odkomentujte a spustte - co se stane?

# S textem se neda pocitat:
c_ * 2      # spustte a prectete si hlasku

# >>> UKOL 7: Vytvorte objekt  cislo_v_uvozovkach <- "7"
#     Zkuste ho vynasobit dvema. Pak ho preved'te na cislo funkci as.numeric()
#     a vynasobte znovu.
cislo_v_uvozovkach <- "7"
cislo_v_uvozovkach * 2 

as.numeric(cislo_v_uvozovkach) * 2

# Specialni hodnoty:
NA        # chybejici hodnota (Not Available)
NULL      # prazdny objekt, "nic"
Inf       # nekonecno
-Inf
NaN       # neni cislo (Not a Number)

1/0       # Inf
0/0       # NaN
sqrt(-1)  # NaN + varovani

# >>> UKOL 8: Vytvorte objekt  pocet_pavouku , jehoz hodnota bude neznama.
pocet_pavouku <- NA 

# 5. Operatory ----------------------------------------------------------------

# Aritmeticke:
7 + 3
7 - 3
7 * 3
7 / 3
7 %/% 3   # celociselne deleni  -> 2
7 %% 3    # zbytek po deleni    -> 1
7 ^ 3     # mocnina
7 ** 3    # totez, ale nepouzivejte

# >>> UKOL 9: Odectete od pocet_prstu rok vzniku jazyka R.
#     (Rok si najdete - je to jedna z veci, kterou byste mel/a vedet.)
vznik_R <- 1993
pocet_prstu - vznik_R

# >>> UKOL 10: Vynasobte pocet_prstu poctem noh a vydelte poctem nosu.
#      Cely vyraz umocnete na -1.

pocet_nosu <- 1
(pocet_prstu * pocet_noh / pocet_nosu)^-1 

# Porovnavaci:  >   <   >=   <=   ==   !=
# Logicke:      &  (a zaroven)    |  (nebo)    !  (negace)

TRUE & FALSE
TRUE | FALSE
!TRUE

# >>> UKOL 11: Overte jednim vyrazem, ze pocet_prstu je vetsi nez 10
#      A ZAROVEN pocet_noh je mensi nez 10.
pocet_prstu > 10 & pocet_noh < 10 


# 6. Funkce a napoveda --------------------------------------------------------

# Funkce se vola jmenem a kulatymi zavorkami:
sqrt(16)
abs(-7)
round(3.14159, 2)

# Napovedu vyvolate otaznikem:
?round
# Ctete zejmena sekce Usage (jak se vola) a Arguments (co znamenaji parametry).

# Argumenty jde zadat podle poradi NEBO podle jmena:
log(100, 10)                 # podle poradi: x = 100, base = 10
log(x = 100, base = 10)      # podle jmena
log(base = 10, x = 100)      # podle jmena - na poradi uz nezalezi
log(100)                     # base ma vychozi hodnotu - prirozeny logaritmus

# >>> UKOL 12: Podivejte se do napovedy k funkci  round() .
#      Jak se jmenuji jeji argumenty a ktery ma vychozi hodnotu?
help(round) 

# argumenty - x, digits 
# vychozi je digits 

# >>> UKOL 13: Spoctete logaritmus z pocet_prstu pri zakladu rovnem dni
#      vaseho narozeni.
den_naro <- 23
log(x = pocet_prstu, base = den_naro)


# >>> UKOL 14: Najdete v napovede funkci, ktera spocita druhou odmocninu,
#      a pouzijte ji na pocet_prstu.
??"square root"
sqrt(pocet_prstu)


# 7. Prvni vektor -------------------------------------------------------------

# Vektor je rada hodnot stejneho typu. Skladame ho funkci c() - "combine":

domacnost <- c(10, 2, 1, 7)
domacnost
length(domacnost)   # kolik ma prvku

# Prvky vybirame hranatymi zavorkami:
domacnost[1]        # prvni prvek
domacnost[c(1, 3)]  # prvni a treti

# S vektorem se pocita po prvcich:
domacnost * 2
domacnost + 100

# >>> UKOL 15: Vytvorte vektor  muj_vektor , ktery bude obsahovat
#      pocet_noh, pocet_prstu, pocet_nosu a vase oblibene cislo.
cislo_fav <- 6
muj_vektor <- c(pocet_noh, pocet_prstu, pocet_nosu, cislo_fav)


# >>> UKOL 16: Vytisknete druhy prvek toho vektoru.
muj_vektor[2]

#----

# >>> UKOL 17: Spoctete prumer vektoru muj_vektor. Funkci si najdete.
??"average"
mean(muj_vektor)

# Pozor - vektor ma jen JEDEN typ. Co se stane tady?
smiseny <- c(1, 2, "tri")
smiseny
class(smiseny)

#----
# Tomuhle se rika "coercion" - R prevede vsechno na nejobecnejsi typ.
# Vratime se k tomu priste.


# 8. Workspace a poradek ------------------------------------------------------

ls()              # seznam vsech objektu v pameti
# rm(x)           # smaze objekt x
# rm(list = ls()) # smaze VSECHNO - pouzivejte s rozmyslem

# Struktura skriptu: ctyri pomlcky za komentarem udelaji oddelovac,
# ktery se objevi v navigaci dole ve skriptu. Zkuste kliknout.

## Nadpis prvni urovne -----
### Nadpis druhe urovne -----

# >>> UKOL 19: Rozdelte si tenhle skript vlastnimi oddelovaci
#      alespon do dvou urovni.


# 9. Co si odnest --------------------------------------------------------------

# - Skript, ne konzole.
# - <- je prirazeni, == je otazka.
# - R rozlisuje velka a mala pismena.
# - Chybova hlaska je informace, ne trest. Prectete si ji.
# - ?funkce je vas nejlepsi kamarad.
#
# DOMA:
#  - Nainstalujte si R a RStudio na svuj notebook (pokud jeste nemate).
#  - Projdete si na DataCampu: Introduction to R, kapitola 1.
#
# Priste: vektory poradne, prace s nimi, chybejici hodnoty.
