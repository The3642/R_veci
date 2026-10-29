mesta <- c("Praha", "Brno", "Praha", "Ostrava")
f <- factor(mesta)
f

levels(f)         # "Brno" "Ostrava" "Praha" <- abecedně!

nlevels(f)

table(f)

velikost <- c("velky", "maly", "stredni", "maly")
factor(velikost)

f2 <- factor(velikost, 
            levels = c("maly", "stredni", "velky", "obri"),
            ordered = T)


f2
f2[1] > f2[2]
f2[2] > f2[3]

table(f2)


f2 <- droplevels(f2) 
f2

roky <- factor(c("2014", "2019", "2026"))
as.numeric(roky)      # 2 1 3 

as.numeric(as.character(roky)) + 3






valce <- table(mtcars$cyl)
valce

prop.table(valce)

round(prop.table(valce) * 100, 1)


kt <- table(mtcars$cyl, mtcars$am)
kt

addmargins(kt)

prop.table(kt)

prop.table(kt, margin = 1)
prop.table(kt, margin = 2)





vek <- c(19, 34, 67, 25, 51, 78)
skupina <- cut(vek, 
               breaks = c(18, 25, 40, 65, Inf),
               labels = c("18-25", "26-40", "41-65", "66+"),
               right = T,
               include.lowest = T)
skupina

table(skupina)

mtcars$mpg

table(mtcars$mpg)



summary(mtcars$mpg)
dojezd <- cut(mtcars$mpg, 
              breaks = c(0, 17, 23, Inf),
              labels = c("neusporna", "prumerna", "usporna"))
dojezd
table(dojezd)
table(dojezd, useNA = "ifany")
prop.table(table(dojezd))







Sys.Date() # dnešní datum, třída "Date"

Sys.time() # datum a čas, třída "POSIXct"

as.numeric(Sys.Date()) # 20714 <- počet DNÍ od 1. 1. 1970

Sys.Date() + 30 # za 30 dní
Sys.Date() - 7 # před týdnem



datum <- as.Date("2026-10-29")
class(datum)

as.Date("29.10.2026", format = "%d.%m.%Y")
as.Date("10/29/2026", format = "%m/%d/%Y")

# format(1342323), big.mark = "," #????????????

datum_text <- format(datum, "%d.%m.%Y")
class(datum_text)


zacatek <- as.Date("2026-10-01")
konec <- as.Date("2026-10-31")
class(konec - zacatek)

as.numeric(konec - zacatek)

difftime(konec, zacatek, units = "weeks")


weekdays(zacatek)

weekdays(as.Date(2000-01-01))

seq(zacatek, konec, by = "day")

seq(zacatek, by = "week", length.out = 13)
