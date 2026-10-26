## Uloha 1 ----

trzby_veci <- c(410, 395, 430, 452, 480, 505,    # Praha
                320, 310, 335, 350, 372, 390,    # Brno
                210, 205, 225, 232, 250, 241,    # Olomouc
                160, 148, 170, 175, 190, 205)    # Liberec

trzby <- matrix(trzby_veci, nrow = 4 , byrow = TRUE,
                dimnames =list(c("Praha", "Brno", "Olomouc", "Liberec"), 
                               c("led", "uno", "bre", "dub", "kve", "cer")))


dim(trzby)
length(trzby)


## Uloha 2 ----
trzby["Brno", "dub"]

trzby["Olomouc", ]

trzby[ , c("bre", "cer")]

trzby[-1, ]

trzby[, "kve", drop = FALSE]
dim(trzby[, "kve", drop = FALSE])

trzby[ , dim(trzby)[2]]


## Uloha 3 ----

rowSums(trzby)
names(which.max(rowSums(trzby)))

names(which.min(colMeans(trzby)))

apply(trzby, 1, median) 
apply(trzby, 1, sd)

trzby[trzby > 400]


# e) nevim ?????????????????????????????????????????????????????



## Uloha 4 ----

trzby["Brno", "bre"] <- 345


trzby2 <- rbind(trzby, "Ostrava" = c(120, 118, 135, 140, 150, 162))


trzby3 <- cbind(trzby2, "celkem" = rowSums(trzby2))

trzby4 <- rbind(trzby3, "soucet" = colSums(trzby3))


trzby4["soucet", "celkem"] == sum(trzby2)


## Uloha 5 ----
rovnice <- c(2, 1, 1, 1, 2, 1, 1, 1, 3)
A <- matrix(rovnice, nrow = 3, byrow = TRUE,
            dimnames = list(c("e", "l", "k")))

b <- c(225, 245, 320) 


det(A)
# kdyby byla nulova nemela by reseni ???????????????????????

ceny <- solve(A,b)

names(ceny) <- c("espresso", "latte", "kolac")

A%*% ceny == b #????????????????????????????

## Uloha 6 ----

kosiky <- matrix(c(3, 0, 1,
                 1, 1, 0), nrow= 2, byrow = TRUE)
kosiky %*% ceny

kosiky * ceny
#vansovi se podle indexu ne podel maticoveho nasobeni ???????????????????

diag(3) == round(A %*% solve(A), 10)
# nevyslo by to lol ???????????

A_sing <- matrix(c(2, 1, 1, 1, 2, 1, 4, 2, 2), nrow = 3, byrow = TRUE,
                 dimnames = list(c("e", "l", "k")))
det(A_sing)
# determinant je 0

solve(A_sing)
#Error in solve.default(A_sing) : 
#  Lapack routine dgesv: system is exactly singular: U[3,3] = 0
# ma nekonecne mnoho reseni takze zadne secificke nevyjde ??????????????

## Uloha 7 ----
hodnoty <- c(900, 700, 450, 330, 150, 120, 90, 80, 260, 200, 130, 95,      #2025
             980, 760, 470, 360, 160, 125, 95, 70, 300, 230, 120, 110)   #2026

trzby <-array(hodnoty, dim = c(4, 3, 2), 
      dimnames = list(c("Praha", "Brno", "Olomouc", "Liberec"),
                      c("kava", "caj", "dezert"),
                      c("2025","2026")))

trzby["Brno", "dezert", "2026"]

class(trzby[ , , "2026"])
dim(trzby[ , , "2026"])

apply(trzby, 3, sum)

apply(trzby, c(2, 3), sum)

zmena <- sum(trzby[, , "2026"]) - sum(trzby[, , "2025"])

# uloha 7 e nevim ??????????????????????????????????




## Uloha 8 ----

mesice    <- c("led", "uno", "bre", "dub", "kve", "cer",
               "cvc", "srp", "zar", "rij", "lis", "pro")

promenne <- c("teplota", "reklama", "trzba", "pocet_dni")

provoz_vec <- c( -1,  8, 222, 31,   # led
                 0,  6, 198, 28,   # uno
                 5, 10, 266, 31,   # bre
                 NA, 12, 310, 30,   # dub
                 15, 15, 348, 31,   # kve
                 19, 14, 364, 30,   # cer
                 22, 20, 421, 31,   # cvc
                 21, 18, 412, 31,   # srp
                 16, 12, 327, 30,   # zar
                 10,  9, 282, 31,   # rij
                 4, 11, 263, 30,   # lis
                 0, 16, 295, 31)   # pro

provoz <- matrix(provoz_vec, nrow = 12, ncol = 4,byrow = TRUE, 
                 dimnames = list(mesice, promenne))
provoz
dim(provoz)

