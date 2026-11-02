# Uloha 1 -----

trzby_vec <- c(410, 395, 430, 452, 480, 505, # Praha
               320, 310, 335, 350, 372, 390, # Brno
               210, 205, 225, 232, 250, 241, # Olomouc
               160, 148, 170, 175, 190, 205) # Liberec


trzby <- matrix(trzby_vec, nrow = 4, byrow = TRUE,
                dimnames = list(c("Praha", "Brno", "Olomouc", "Liberec"),
                                c("led", "uno", "bre", "dub", "kve", "cer")))

trzby

dim(trzby)
length(trzby)


# Uloha 2 -----

trzby["Brno", "dub"]

trzby["Olomouc", ]

trzby[ , c("bre", "cer")]

trzby[rownames(trzby) != "Praha", ]  

trzby[, "kve", drop = FALSE]
dim(trzby[, "kve", drop = FALSE])

trzby[, ncol(trzby)]

# Uloha 3 -----

## a----

rowSums(trzby)

names(which.max(rowSums(trzby)))


## b----

colMeans(trzby)

names(which.min(colMeans(trzby)))

## c----

apply(trzby, 1, median)
apply(trzby, 1, sd)

## d----

trzby[trzby > 400]
length(trzby[trzby > 400])

## e----

names(which(apply(trzby >= 150, 2, all))) #????????????????????????????

#Uloha 4----

# a----- 

trzby["Brno", "bre"] <- 345
 
# b----- 

ostrava <- c(120, 118, 135, 140, 150, 162)

trzby2 <- rbind(trzby, "Ostrava" = ostrava)

# c----- 

trzby3 <- cbind(trzby2, "celkem" = rowSums(trzby2))

# d----- 

trzby4 <- rbind(trzby3, "soucet" = colSums(trzby3))

sum(trzby2) == trzby4[dim(trzby4)[1], dim(trzby4)[2]]

#Uloha 5----

## a ----

A <- matrix(c(2, 1, 1, 1, 2, 1, 1, 1, 3), nrow = 3, byrow = TRUE,
            dimnames = list(NULL, c("e", "l", "k")))


b <- c(225, 245, 320)

## b----

det(A)
# determinant neni nula, takze matice je regularni a soustava ma prave jedno reseni

## c----

ceny <- solve(A, b) 

names(ceny) <- c("espresso", "latte", "kolac")

## d----

all.equal(as.vector(A %*% ceny), b) #????????????????????????????????????????????

#Uloha 6----

kosiky <- matrix(c(3, 0, 1,
                   1, 1, 0), nrow = 2, byrow = TRUE)

kosiky %*% ceny

kosiky * ceny
# je nasobeni po prvcich, kosiky ma 6 prvku, ceny 3, takze se ceny recykluje po sloupcich a prvky se nasobi spatnymi cenami ale vynasobi se 

diag(3)

all(round(A %*% solve(A), 10) == diag(3)) #??????????????????????????????????????
# Zaokrouhleni je potreba kvuli numerickym nepresnostem pri vypoctu inverzni matice


A_sing <- rbind(A[1:2, ], c(4, 2, 2))

det(A_sing)

# solve(A_sing, c(225, 245, 450))
#Error in solve.default(A_sing, c(225, 245, 450)) : Lapack routine dgesv: system is exactly singular: U[3,3] = 0

# treti rovnice je dvojnasobkem prvni rovnice tedy nejsou linearne nezavisle a tato soustava ma nekonecne mnoho reseni


#Uloha 7----

hodnoty <- c(900, 700, 450, 330, 150, 120, 90, 80, 260, 200, 130, 95, # 2025
             980, 760, 470, 360, 160, 125, 95, 70, 300, 230, 120, 110) # 202

## a----

pole <- array(hodnoty, dim = c(4, 3, 2),
              dimnames = list(c("Praha", "Brno", "Olomouc", "Liberec"),
                              c("kava", "caj", "dezert"),
                              c("2025", "2026")))

## b----

pole["Brno", "dezert", "2026"]

## c----

pole[, , "2026"]
class(pole[, , "2026"])
dim(pole[, , "2026"])
 
## d----

apply(pole, 3,sum)
apply(pole, c(1, 3), sum)

## e----

zmena <- pole[, , "2026"] - pole[, , "2025"]

names(which.max(rowSums(zmena)))

names(which.max(colSums(zmena)))

sum(zmena < 0)

zmena[zmena < 0] #???????????????????????????????

#Uloha 8----

mesice <- c("led", "uno", "bre", "dub", "kve", "cer",
            "cvc", "srp", "zar", "rij", "lis", "pro")
promenne <- c("teplota", "reklama", "trzba", "pocet_dni")
provoz_vec <- c( -1, 8, 222, 31, # led
                 0, 6, 198, 28, # uno
                 5, 10, 266, 31, # bre
                 NA, 12, 310, 30, # dub
                 15, 15, 348, 31, # kve
                 19, 14, 364, 30, # cer
                 22, 20, 421, 31, # cvc
                 21, 18, 412, 31, # srp
                 16, 12, 327, 30, # zar
                 10, 9, 282, 31, # rij
                 4, 11, 263, 30, # lis
                 0, 16, 295, 31) # pro

## a ----

provoz <-matrix(provoz_vec, nrow = 12, ncol = 4, byrow = TRUE,
                dimnames = list(mesice, promenne))

provoz
dim(provoz)

## b ----

rownames(provoz)[is.na(provoz[, "teplota"])] #??????????????????????????????????????

provoz[complete.cases(provoz),]
ok <- provoz[complete.cases(provoz), ] 


ok <- cbind(ok, "trzba_na_den" = round(ok[, "trzba"] / ok[ , "pocet_dni"], 2))

names(which(mean(ok[, "trzba_na_den"]) < ok[, "trzba_na_den"])) #??????????????????????????


## c ----

X <- matrix(c(rep(1, nrow(ok)), ok[, "teplota"], ok[, "reklama"]), nrow = nrow(ok))  


colnames(X) <- c("intercept", "teplota", "reklama")

y <- ok[, "trzba"]


beta <- solve(t(X) %*% X, t(X) %*% y)   
round(beta, 3)          

vyrovnane <-  X %*% beta
vyrovnane


## d ----

scenare <- rbind(zima = c(1, 5, 10),
                 leto = c(1, 25, 20))

scenare %*% beta


rezidua <- y - vyrovnane
names(rezidua) <- rownames(ok)

names(which.max(abs(rezidua)))


## e ----

souhrn <- matrix(
  round(c(ok[, "trzba"], vyrovnane, rezidua), 1),ncol = 3,
  dimnames = list(rownames(ok), 
                  c("skutecna", "vyrovnana", "odchylka")))

souhrn[abs(souhrn[, "odchylka"]) > 5, , drop = FALSE]
