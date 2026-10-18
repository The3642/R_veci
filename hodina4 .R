student <- list(prijmeni = "Novak", vek = 21,
                znamky = c(1, 2, 3), aktivni = TRUE)
student
length(student) # 4
names(student) # "prijmeni" "vek" "znamky" "aktivni"
str(student) # <- tohle dělejte u každého nového objektu
student[2] # LIST o jednom prvku
student[[2]] 



prodejny <- data.frame(mesto = c("Praha", "Brno", "Ostrava", "Plzen"),
                       trzba = c(1250, 830, 640, 510),
                       zamest = c(12, 9, 7, 6),
                       otevreno = c(TRUE, TRUE, FALSE, TRUE))
prodejny

is.list(prodejny)
class(prodejny)

str(prodejny)
summary(prodejny)

head(prodejny, n = 2)
tail(prodejny, n = 2)

nrow(prodejny)
ncol(prodejny)
dim(prodejny)
colnames(prodejny)
rownames(prodejny)
names(prodejny)

sapply(prodejny,class)

data()

df <- mtcars
df




prodejny [1, ]
prodejny[, 2, drop = FALSE]
prodejny[2, 3]
prodejny

prodejny[1:2, c("mesto", "zamest")]
class(prodejny$mesto)

prodejny["mesto"]
prodejny[ , "mesto"]

mean(prodejny$trzba)

class(prodejny[1, ])

prodejny[prodejny$trzba > 700, ]

prodejny[prodejny$trzba > 700 & prodejny$zamest > 10, ]

prodejny[prodejny$trzba > 700, c("mesto", "zamest")]

sum(prodejny$trzba > 700)

subset(prodejny, trzba > 700, select = c(mesto, zamest))

prodejny[trzba > 700, ]
prodejny[prodejny$trzba > 700]
mtcars[mtcars$mpg > 20]
ncole(mtcars)


prodejny$na_zamestnance <- prodejny$trzba / prodejny$zamest
str(prodejny)


novy_radek <- data.frame(mesto = "Liberec", trzba = 420, zamest = 5,
                         otevreno = TRUE, na_zamestnance = 420 / 5)
rbind(prodejny, novy_radek)


kody_kraju <- c("PHA", "JHM", "MSK", "PLK", "LBK")
prodejny <- cbind(prodejny, kraj = kody_kraju) 


prodejny$na_zamestnance <- NULL
prodejny[1, 2] <- 1350
prodejny[prodejny$mesto == "Praha", "trzba"] <- 1250 


x <- c(30, 10, 20)
sort(x) # 10 20 30 <- HODNOTY
order(x) # 2 3 1 <- POZICE
x[order(x)] # 10 20 30 <- proto se order() strká do závorek


prodejny[order(prodejny$trzba), ] # vzestupně
prodejny[order(-prodejny$trzba), ] # sestupně
prodejny[order(prodejny$mesto, decreasing = TRUE), ] # text: jen decreasing


head(mtcars[order(mtcars$cyl, -mtcars$mpg), c("cyl", "mpg")], 10) # dva klíče


prodejny[order(prodejny$trzba), ]
prodejny[order(prodejny$trzba, decreasing = TRUE), ]

mtcars[order(mtcars$cyl, -mtcars$mpg), 10]

is.na(c(1, 2 ,NA))

is.na(airquality)
sum(is.na(airquality))
colSums(is.na(airquality))

complete.cases(airquality)

dim(airquality[complete.cases(airquality), ])

cisty <- na.om(airquality)

trzby <- data.frame(mesto = c("Praha", "Brno", "Ostrava", "Plzen"),
                    trzba = c(1250, 830, 640, 510))
kraje <- data.frame(mesto = c("Praha", "Brno", "Ostrava", "Liberec"),
                    kraj = c("PHA", "JHM", "MSK", "LBK"))

merge(trzby, kraje)

merge(trzby, kraje, all.x = TRUE)
merge(trzby, kraje, all.y = TRUE)


merge(trzby, kraje, all = TRUE)

kraje2 <- kraje
names(kraje2)[1] <- "obec"

merge(trzby, kraje2, by.x = "mesto", by.y = "obec")
