library(dplyr)

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

plot(data$mpg, data$hp, col=data$cyl, pch=19)
lo<-loess(hp~wt, data=data)
lines(predict(lo), col='red', lwd=2)


###### ANOVA #####
data %>%
  group_by(cyl) %>%
  summarise(n=n())

data %>%
  group_by(am, cyl) %>%
  summarise(n=n())

boxplot(mpg~cyl, data=data)
lm1<-lm(mpg~cyl, data=data)
anova(lm1)

boxplot(mpg~am+cyl, data=data)

lm2<-lm(mpg~am+cyl, data=data)

anova(lm2)

interaction.plot(x.factor = data$cyl, trace.factor = data$am, response = data$mpg,
                 xlab = "Cyl", ylab="MPG", trace.label = "Manual")
