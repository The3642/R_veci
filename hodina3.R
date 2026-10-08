m <- matrix(1:6, nrow= 2)
m
y <- matrix(0, nrow = 3, ncol = 3)
y

z <- matrix(1:6, nrow = 2, byrow = TRUE)
z

matrix()

matrix(nrow = 3, ncol = 3)

matrix(1:6, ncol = 2)
matrix(1:6, ncol = 2, byrow = TRUE)

 rozmery <- dim(m)
 rozmery
 
dim(m)[1]
dim(m)[2]


nrow(m)
ncol(m)
length(m)

v <-1:12
dim(v) # pouze pro dvoi a více dimenzove 
dim(v) <- c(3, 4)
v


matrix(1:4, nrow = 4, ncol = 2) # recyklace budu mit dva stejne sloupce

matrix(1:4, nrow = 3, ncol = 2) # neni nasobek takze to dela debilne


prodeje <- matrix(c(120, 95, 143, 110, 88, 150), nrow = 2, byrow = TRUE)
prodeje 
rownames(prodeje) <- c("Praha", "Brno")
colnames(prodeje) <- c("leden", "unor", "brezen")
prodeje

prodeje[1, 1] # nejdriv radek pak sloupec 
prodeje["Praha", "leden"]


prodeje[1, ] # abych dostal radek musim dat carku a za ni nic 
prodeje[ , 2]
prodeje [, c(2,3)]
prodeje [ , -1]
prodeje[ , prodeje["Praha", ] > 100]

praha <- prodeje[1,  , drop = FALSE]
praha_bad <- prodeje[1, ] # toto by nefungvala jak chci 

class(praha)
dim(praha)



pasteO("s", 1:4)
popisky <- paste0("s", 1:4)  #neco coallps



A <- matrix(1:12, nrow = 3, byrow = TRUE)
rownames(A) <- c("r1", "r2", "r3")
colnames(A) <- c("s1", "s2", "s3", "s4")
A

A[2, ]
A[ ,3]


A[2,3]
A["r2", "s3"] 

dim(A [ , 1, drop = FALSE])

A[A[1, ] >2]
A[ , A["r1", 1 > 2]]




prodeje2 <- rbind(prodeje, Ostrava = c(70, 65, 80)) # radek zespodu
prodeje3 <- cbind(prodeje2, duben = c(130, 140, 90)) # sloupec zprava

rbind(1:3, 4:6)
cbind(1:3, )


x <- matrix(1:4, nrow = 2)
y <- matrix(1:4*100, nrow = 2). #?????
x+y 
x/y
x %% y

t(x)

det(x)

solve(x)

x %% solve(x). # dyk moe nevin 


b <- c(2,3)
solve(x ,b )# soustava rovnic 

diag(x)
diag(3)
diag(1,2,3)

prodeje3

rowSums(prodeje3) # součet každého řádku
colSums(prodeje3) # součet každého sloupce
rowMeans(prodeje3) # průměr každého řádku
colMeans(prodeje3) # průměr každého sloupce

apply(prodeje3, 1, median) # radky
apply(prodeje3, 2, median) #sloupce

pole <- array(1:12, dim = c(2, 3, 2)) 
pole
dim(pole)
length(pole)

pole[1, 1, 1]

pole[ , , 1]


dimnames(pole) <- list(c("Praha", "Brno"),
                       c("leden", "unor", "brezen"),
                       c("2025", "2026"))

apply(pole, 3, sum)
