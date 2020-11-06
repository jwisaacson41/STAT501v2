#' Sample Script for STAT 501 Presentation

x1<-rnorm(1000, 0, 3)
x2<-rnorm(1000, 3, 4)

plot(density(x1), main="X1 vs X2", lwd=2)
lines(density(x2), col="red", lwd=2)

mean(x1)
mean(x2)
t.test(x1, x2)
boxplot(x1, x2, xlab = "Group", ylab="Value")

##### Import & Clean Data #####
data<-mtcars
str(data)
summary(mtcars)
pairs(mtcars)

data$cyl<-as.factor(data$cyl)
data$am<-as.factor(data$am) #0 = auto, 1 = manual
data$gear<-as.factor(data$gear)
data$vs<-as.factor(data$vs) #Engine shape: 0=v-shape, 1=straight

###### Exploratory Data #####
boxplot(qsec~gear, data=data)

plot(data$wt, data$qsec, pch=19)
lo<-loess(qsec~wt, data=data)
lines(predict(lo), col='red', lwd=2)


plot(data$wt, data$hp, pch=19)
lo<-loess(hp~wt, data=data)
lines(predict(lo), col='red', lwd=2)

plot(data$hp, data$qsec, pch=19)
lo<-loess(hp~qsec, data=data)
lines(predict(lo), col='red', lwd=2)

predict(lo)