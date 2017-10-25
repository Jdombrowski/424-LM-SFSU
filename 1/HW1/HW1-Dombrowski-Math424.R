# Source Code Dombrowski HW1
# Completed in R

message(“Question 22”)
load("VOLTAGE.Rdata")
oldLocationVolt <- VOLTAGE$VOLTAGE[c(0:30)]
newLocationVolt <- VOLTAGE$VOLTAGE[c(31:60)]
hist(oldLocationVolt)
stem(oldLocationVolt)
hist(newLocationVolt)

message("Question 26")
load("FTC.Rdata")
FTC
hist(FTC$NICOTINE)
summary(FTC)
pnorm( 1.53605, mean = 0.845, sd = 0.3455250 )
pnorm( 1.53605, mean = 0.845, sd = 0.3455250 ) - pnorm(0.1.5395, mean = 0.845, sd = 0.3455250 )
pnorm( 1.53605, mean = 0.845, sd = 0.3455250 ) - pnorm(0.15395, mean = 0.845, sd = 0.3455250 )

message("Question 44")
head(FTC)
hist(FTC$NICOTINE)

message("Question 67")
load("RUDE.Rdata")
head(RUDE)
RUDE
controlGroup <- RUDE$USESBRICK[c(0:53)]
rudeGroup <- RUDE$USESBRICK[c(54:98)]
t.test(controlGroup, rudeGroup, alternative = "less", var.equal=FALSE)
mean(controlGroup)
mean(rudeGroup)
help(t.test)
t.test(controlGroup, rudeGroup, alternative = "g", var.equal=FALSE)

message("Question 70")
t.test(oldLocationVolt, newLocationVolt, conf.level = 0.9)
t.test(oldLocationVolt, conf.level = 0.9)
t.test(newLocationVolt, conf.level = 0.9)
9.804-9.422

message("Question 72")
load("REDLIGHT.Rdata")
REDLIGHT
beforeRedlight <- REDLIGHT$BEFORE
afterRedlight <- REDLIGHT$AFTER
t.test(beforeRedlight, afterRedlight, conf.level = 0.9)

message("Question 75")
load("HONEYCOUGH.Rdata")
HONEYCOUGH
honeyGroup <- HONEYCOUGH$TOTSCORE[c(0:35)]
controlNoHoneyGroup <- HONEYCOUGH$TOTSCORE[c(36:68)]
var.test(honeyGroup , controlNoHoneyGroup, alternative= "two-sided", conf.level = 0.90)
var.test(honeyGroup , controlNoHoneyGroup, alternative= "two.sided", conf.level = 0.90)