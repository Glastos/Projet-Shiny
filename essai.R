library(hpackedbubble)

dataBubble <- cbind(rep(rownames(mat),each = ncol(mat)),pivot_longer(mat,colnames(mat)))
dataBubbleF <- dataBubble[which(dataBubble[,3]>100),]
colnames(dataBubbleF) <- c("Profile","Genre","count")


hpackedbubble(dataBubbleF$Profile, dataBubbleF$Genre, dataBubbleF$count,
              title = "Viewing number by genre for each profile",
              pointFormat = "<b>{point.name}:</b> {point.y} Visionnages",
              dataLabelsFilter = 1000,
              packedbubbleMinSize = "25%",
              packedbubbleMaxSize = "350%",
              theme = "sunset",
              packedbubbleZMin = 0,
              packedbubbleZmax = 10000, split = 0,
              gravitational = 0.02,
              parentNodeLimit = 1,
              dragBetweenSeries = 0,
              width = "100%")




