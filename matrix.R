library(magrittr)
library(dplyr)
library(tidyr)

dat <- read.csv("src/data/netflex5.csv")
dat$Genre[is.na(dat$Genre)] <- 'undefined'

genre <- paste(unlist(dat$Genre), collapse=' ')%>%
  strsplit(" ")%>%
  unlist()%>%
  sub(",$",  "", .)%>%
  unique()

mat <- matrix(0, nrow = length(unique(dat$Profile)), ncol = length(genre))
colnames(mat) <- genre
rownames(mat) <- unique(dat$Profile)

for (i in 1:nrow(dat)) {
  for (j in 1:ncol(mat)) {
    if (grepl(genre[j], dat$Genre[i], fixed = TRUE)) {
      mat[dat$Profile[i],j] <- mat[dat$Profile[i],j] + 1
    }
  }
  if (i/1000 == ceiling(i/1000)) {
    print(i)
  }
}

write.csv(mat, "src/data/mat.csv", fileEncoding = "utf8")
