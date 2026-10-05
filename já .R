petr_prd <- c(leden = 14, unor = 20, brezen = 2, duben = 67)
patrik_prd <- c(leden = 32, unor = 0, brezen = 15, duben = 69)
names(petr_prd)
patrik_prd

patrik_prd > 18
petr_prd [-c(1, 2)]


a <- c(1, 2, 3, 4)
a + c(100, 200)

gramy_skera <- c(21.5, 19.8, NA, 22.1, NA, 20.4)
names(gramy_skera) <- c("po","ut","st","ct","pa") 
gramy_skera

length(gramy_skera) 
mean(gramy_skera, na.rm = TRUE)
sum(is.na(gramy_skera))
which(is.na(gramy_skera)) 


penis <- c(12, 13, 4, 10, 11.67, NA)
names(penis) <- c("Petr", "Patrik", "Matej", "Hory", "Ladin", "Ja" )
penis
