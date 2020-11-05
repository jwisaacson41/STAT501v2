#' Sample Script for STAT 501 Presentation

x1<-rnorm(1000, 0, 3)
x2<-rnorm(1000, 3, 4)

plot(density(x1), main="X1 vs X2", lwd=2)
lines(density(x2), col="red", lwd=2)

mean(x1)
mean(x2)
t.test(x1, x2)
boxplot(x1, x2, xlab = "Group", ylab="Value")
