# R source code
#Question 8
load("TAMPALMS.Rdata")

markVal <- TAMPALMS$Market_Val
salesPrice <- TAMPALMS$Sale_Price
relation <- lm(salesPrice~markVal)

plot(markVal,salesPrice)
abline(relation)
1.36*300 + 1.408

#Question 14

load("SMELTPOT.Rdata")
View(SMELTPOT)
poro <- SMELTPOT$POROSITY
diam <- SMELTPOT$DIAMETER
lsfit(diam,poro)
relation <- lm(diam~poro)
plot(poro, diam, main="Q14 Apparent Porosity vs. Mean Pore Diameter", xlab="Mean Pore Diameter(micrometers)", ylab = "Apparent Porosity (%)")
abline(relation)

predict.lm(relation, newdata = data.frame(POROSITY= 10), type="term")
6.3518+0.9498*10

#Question 20
anova(relation)
summary(relation)

#Question 22

load("HEAT.Rdata")
ratio <- HEAT$RATIO
heat <- HEAT$HEAT
plot(ratio,heat, main= "Q22 Ratio vs. Heat", xlab = "RATIO", ylab = "HEAT")
relation <- lm(heat~ratio,data=HEAT)
summary(relation)
lsfit(ratio,heat)#just to double check
abline(relation)#add it to the plot

#Question28
load("BOXING2.Rdata")
View(BOXING2)
lactate <- BOXING2$LACTATE
recovery <- BOXING2$RECOVERY
plot(lactate, recovery, main = "Q28 Massage effectiveness on the recovery rates of boxers")
cor.test(lactate, recovery, conf.level = 0.9)
relation <- lm(recovery~lactate)
abline(relation)
summary(relation) 

#Question 32
load("HEAT.Rdata")
View(HEAT)
ratio <- HEAT$RATIO
heat <- HEAT$HEAT
plot(ratio, heat, main = "Q32 Heat given Ratio")
HEAT.lm <- lm(heat~ratio, data=HEAT)
summary(HEAT.lm)
anova(HEAT.lm)

#Question 40 
load("TAMPALMS.Rdata")
marketVal <- TAMPALMS$Market_Val
salesPrice <- TAMPALMS$Sale_Price
cor.test(marketVal, salesPrice)

#Question 54
load("NAMEGAME2.Rdata")
position <- NAMEGAME2$POSITION
recall <- NAMEGAME2$RECALL
plot(position, recall, main = "Q54")
NAMEGAME2.lm <- lm(recall~position)
abline(NAMEGAME2.lm)
summary(NAMEGAME2.lm)
cor.test(recall, position)
position5 <- subset(NAMEGAME2 , POSITION == 5)
t.test(position5$RECALL)
predict(NAMEGAME2.lm, newdata = data.frame(position = 5), interval = "predict")

#Question 60
load("PGADRIVER.Rdata")
View(PGADRIVER)
distance <- PGADRIVER$DISTANCE
accuracy <- PGADRIVER$ACCURACY
PGADRIVER.lm <- lm(accuracy~distance, data = PGADRIVER)
plot(distance, accuracy, main= "Q60")
abline(PGADRIVER)
cor.test(distance, accuracy)
