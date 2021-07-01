# STEP 1 : LOAD DATA
data <- read.table('emissionssw.dat.txt', header = F)
data <- data %>% 
  dplyr::rename(
    nox = V1,
    noxem = V2,
    ws = V3,
    humidity = V4
  )
data = data[-1,]
data <- data.frame(data)
data$nox <- as.numeric(data$nox)
data$ws <- as.numeric(data$ws)
data$humidity <- as.numeric(data$humidity)
data$noxem <- as.numeric(data$noxem)

#STEP 2 : OVERVIEW WITH PAIR SCATTER PLOTS
pairs(data, lower.panel = NULL, col = 'blue')

# STEP 3 : FIT THE FULL MODEL : MODEL 1 
model1 <- lm(nox ~ noxem + ws + humidity, data = data)
summary(model1)
{par(mfrow=c(2,2))
  plot(model1, which=1:4)}

# STEP 4 : BOXCOX TRANSFORMATION 

#find best lambda for full model
bc = boxcox(model1, lambda = seq(-3,3))
best_lambda_full = bc$x[which (bc$y == max (bc$y))]
#use lambda = 0 --> log transformation of the response 

#operate boxcox transformation 
bc_model1 <- lm (log(nox) ~ noxem + ws + humidity, data = data)
summary(bc_model1)
{par(mfrow=c(2,2))
  plot(bc_model1, which=1:4)}

#STEP 5 : VARTIABLE TRANSFORMATION 
#the boxcox model doesn't seem to be efficient enough
#thus we proceed to variable transformation 

data$LogNox <- log(data$nox) 
data$LogNoxem <- log(data$noxem) 
data$LogWs <- log(data$ws) 
data$LogHumidity <- log(data$humidity)

lH<- ggplot(data= data, aes(y=LogNox, x=LogHumidity))+ geom_point()+
  geom_smooth(se=FALSE)

lNoxem<- ggplot(data= data, aes(y=LogNox, x=LogNoxem))+ geom_point()+
  geom_smooth(se=FALSE)

lW<- ggplot(data= data, aes(y=LogNox, x=LogWs))+
  geom_point()+ 
  geom_smooth(se=FALSE)

grid.arrange(lH, lNoxem, lW, ncol=2)

#STEP 6 : FINAL MODEL 
finalmodel <- lm(LogNox~ LogNoxem+ LogWs+ I(LogWsˆ2), data=data) 
summary(finalmodel)
#linear hypothesis tests 
linearHypothesis(finalmodel, c('1*LogWs=0'))
linearHypothesis(finalmodel, c('1*I(LogWsˆ2)=0'))
linearHypothesis(finalmodel, c('1*LogNoxem =0'))
#confidence intervals
confint(finalmodel)
#analysis of plots 
plot(finalmodel)
#plots residuals 
plot(residuals(finalmodel), type='l', ylab='Residuals', xlab='time')

#STEP 7 : TESTING 
anova(finalmodel)
linearHypothesis(finalmodel, c('1*LogNoxem- 1*LogWs=0'))
linearHypothesis(finalmodel, c('1*LogNoxem- 1*I(LogWsˆ2)=0'))
coef(finalmodel)


