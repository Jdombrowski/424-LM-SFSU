# Q 24
load("PACGEESE.Rdata")
model <- glm(RESPONSE~ALTITUDE+LATERAL, family = binomial(link = 'logit'),data = PACGEESE)
summary(model)
anova(model, test = "Chisq")
1-pchisq(model$null.deviance-model$deviance, model$df.null-model$df.residual)
  newdata = data.frame(ALTITUDE=6, LATERAL=3)
predict(model,newdata,type="response")
logLik(model)

# Q 26
load("MTBE.Rdata")
wellclass <- MTBE$WellClass
aquifer <- MTBE$Aquifier
ph <- MTBE$pH
welldepth <- MTBE$Depth
do2 <- MTBE$DissOxy
d2f <- MTBE$Distance
pind <- MTBE$IndPct
detet <- MTBE$MTBEDetect
levels(detet) = c(0,1)
# fitting the initial model
model <- glm( detet ~ wellclass+aquifer+ph+welldepth+do2+d2f+pind, family = binomial(link = 'logit'))
par(mfrow=c(2,2))
plot(model)
summary(model)
1-pchisq(model$null.deviance-model$deviance, model$df.null-model$df.residual)
#suggested model
model <- glm( detet~ wellclass+ph+welldepth, family = binomial(link = 'logit'))
summary(model)
par(mfrow=c(2,2))
plot(model)
logLik(model)
1-pchisq(model$null.deviance-model$deviance, model$df.null-model$df.residual)

# Q 28
#smartbond = 1 , composite = 0
load("BONDING.Rdata")
model = glm(BONDING$ADHESIVE~BONDING$ARISCORE, family = binomial(link = "logit"))
summary(model)
1-pchisq(model$null.deviance-model$deviance, model$df.null-model$df.residual)
logLik(model)