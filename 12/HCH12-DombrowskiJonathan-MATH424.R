## Jonathan Dombrowski
# load("TILLRATIO.Rdata")
# model = lm(RATIO~BOREHOLE, data = TILLRATIO)
# model.aov = aov(model)
# summary(model)
# summary(aov(model))
# plot(model.aov)
# boxplot(TILLRATIO$RATIO~TILLRATIO$BOREHOLE)


# # Q 26
# load("BOXING.Rdata")
# boxer = as.factor(BOXING$BOXER)
# model = lm(POWER~boxer+ROUND,data = BOXING)
# summary(model)
# aov(model)
# modelRound = lm(POWER~ROUND,data = BOXING)
# summary(modelRound)
# modelJustBoxers = lm(POWER~boxer, data = BOXING)
# summary(modelJustBoxers)
# boxplot(BOXING$POWER~BOXING$BOXER, xlab= "Boxer number", ylab = "Power")
# boxplot(BOXING$POWER~BOXING$ROUND, xlab= "Round", ylab = "Power")
# pf(q=4.158, df1 = 28, df2 = 3, lower.tail=FALSE )
# pf(q=13.23, df1 = 24, df2 = 7, lower.tail=FALSE )

# #Q36
# load("EGGS2.Rdata")
# model = lm(OVERRUN~HOUSING+WTCLASS + HOUSING:WTCLASS,data = EGGS2)
# summary(model)
# summary(aov(model))

# modelA = lm(OVERRUN~HOUSING, data = EGGS2)
# summary(modelA)

# modelB = lm(OVERRUN~WTCLASS, data = EGGS2)
# summary(modelB)

# boxplot(EGGS2$OVERRUN~EGGS2$WTCLASS, xlab ="WeightClass", ylab = "% Overrun")
# boxplot(EGGS2$OVERRUN~EGGS2$HOUSING, xlab ="Housing Type", ylab = "% Overrun")

# #Q 56
# TukeyHSD(aov(modelA),conf.level = 0.95, ordered = TRUE)

# # Q 65
# model = lm(RATIO~BOREHOLE, data = TILLRATIO)
# model.aov = aov(model)
# summary(model)
# summary(model.aov)
# qt(0.9,21,5,lower.tail = FALSE)
# boxplot(RATIO~BOREHOLE, xlab ="RATIO", ylab = "BOREHOLE", data=TILLRATIO)
# TukeyHSD(model.aov, conf.level = 0.9)
