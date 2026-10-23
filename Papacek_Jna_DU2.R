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
