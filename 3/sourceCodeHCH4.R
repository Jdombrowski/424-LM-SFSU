#Jonathan Dombrowski HCH4 source code 
# Question 10 
load("SNOWGEESE.Rdata")
View(SNOWGEESE)
weightChange <- SNOWGEESE$WTCHNG
digEff <- SNOWGEESE$DIGEFF
adfiber <- SNOWGEESE$ADFIBER
SNOWGEESE.lm <- lm(weightChange ~ digEff+ adfiber)
summary(SNOWGEESE.lm)
par(mfrow=c(2,1))
plot(digEff, weightChange)
plot(adfiber, weightChange)
SNOWGEESE.lm2 <-lm(weightChange ~ digEff + adfiber)
summary(SNOWGEESE.lm2)
confint(SNOWGEESE.lm2, "adfiber", conf.level=0.99)

#Q 24 --------------------------------------------------
load("GASTURBINE.Rdata")
rpm <- GASTURBINE$RPM
cpratio <- GASTURBINE$CPRATIO
inlettemp <- GASTURBINE$INLETTEMP
exhtemp <- GASTURBINE$EXHTEMP
airflow <- GASTURBINE$AIRFLOW
heatrate <-  GASTURBINE$HEATRATE
GASTURBINE.lm < - lm(heatrate ~ rpm + cpratio + inlettemp + exhtemp + airflow )
summary(GASTURBINE.lm)
predict(GASTURBINE.lm, newdata = data.frame(rpm = 7500, inlettemp = 1000, exhtemp = 525, cpratio= 13.5 , airflow = 10.0) , interval = "prediction")

#Q 25 --------------------------------------------------
load("WATEROIL.Rdata")
View(WATEROIL)
voltage <- WATEROIL$VOLTAGE
volume <- WATEROIL$VOLUME
salinity <- WATEROIL$SALINITY
temp <- WATEROIL$TEMP
delay <-  WATEROIL$DELAY
surfac <- WATEROIL$SURFAC
triton <- WATEROIL$TRITON
solid <- WATEROIL$SOLID

WATEROIL.lm <- lm(voltage ~ volume + salinity+ surfac)



ASK KAFAI ABOUT THIS YES
predict(WATEROIL.interact.lm, newdata=data.frame(volume = max(WATEROIL$VOLUME), salinity = min(WATEROIL$SALINITY), surfac = min(WATEROIL$SURFAC)),interval = "prediction")
predict(WATEROIL.interact.lm, newdata=data.frame(volume =80, salinity = 1, surfac = 2),interval = "prediction")

# %---------------------------------------------------------
#Q33
#
load("WATEROIL.Rdata")
View(WATEROIL)
voltage <- WATEROIL$VOLTAGE
volume <- WATEROIL$VOLUME
salinity <- WATEROIL$SALINITY
temp <- WATEROIL$TEMP
delay <-  WATEROIL$DELAY
surfac <- WATEROIL$SURFAC
triton <- WATEROIL$TRITON
solid <- WATEROIL$SOLID

WATEROIL.interact.lm <- lm(voltage ~ salinity + volume + surfac + I(salinity*volume) + I(volume*surfac))
summary(WATEROIL.interact.lm)
plot(voltage~salinity, ylim = c(-1,3.5),main ="Question 33 Volume vs Salinity with 
	various fixed volume and surface values and a Varying Salinity ")
curve(predict(WATEROIL.interact.lm, newdata = data.frame(salinity =x ,volume = 40 , surfac = 2)), col ="blue", add =T)
curve(predict(WATEROIL.interact.lm, newdata = data.frame(salinity =x ,volume = 80 , surfac = 2)), col ="red", add =T)
curve(predict(WATEROIL.interact.lm, newdata = data.frame(salinity =x ,volume = 40 , surfac = 4)), col ="green", add =T)
curve(predict(WATEROIL.interact.lm, newdata = data.frame(salinity =x ,volume = 80 , surfac = 4)), col ="lightblue", add =T)
legend(0,3.0 , legend=c("(40,2)" , "(80,2)" , "(40,4)" , "(80,4)"), col = c("blue","red","green","lightblue"), lty=1:2, cex =0.8, title= "Line Types", bg= "white")
#-------------------------------------------------------
#Q 42
#
load("INFECTION.Rdata")
View(INFECTION)
rate <- INFECTION$RATE
estimate <- INFECTION$EST
rateTrimmed <- INFECTION$RATE[c(0:23)]
estimateTrimmed <- INFECTION$EST[c(0:23)]
INFECTION.lm <- lm(rate~estimate)
INFECTION.curvil.lm <- lm(rate~estimate+I(estimate**2))
summary(INFECTION.curvil.lm)
INFECTION.trimmed.lm <- lm(rateTrimmed~estimateTrimmed)
plot(rate~estimate)
abline(INFECTION.lm)
abline(INFECTION.lm, col = "black")
abline(INFECTION.trimmed.lm, col = "green")
legend(0,150000, legend=c("full dataset", "omitting Botulism"), col = c("black","green"), lty=1:2, cex =0.8, title= "Line Types", bg= "grey")
summary(INFECTION.lm)
summary(INFECTION.trimmed.lm)
#-------------------------------------------------------
#Q 53
#-------------------------------------------------------
load("ACCHW.Rdata")
View(ACCHW)
improve <- ACCHW$IMPROVE
assist <- ACCHW$ASSIST
ACCHW.lm <- lm(improve~factor(assist))
summary(ACCHW.lm)
#-------------------------------------------------------
#Q 58
#-------------------------------------------------------
load("REPELLENT.Rdata")
View(REPELLENT)
type <- REPELLENT$TYPE
cost <- REPELLENT$COST
hours = REPELLENT$HOURS
#lotion/cream = 1 in this model 
REPELLENT.lm = lm(cost~factor(type) + hours)
summary(REPELLENT.lm)
plot(cost~hours, main= "Q 58 Cost vs. Hours of Protection of Mosquito Repellent")
abline(REPELLENT.lm, col = "blue")

REPELLENT.lm = lm(hours~factor(type) + cost)
summary(REPELLENT.lm)
#-------------------------------------------------------
#Q 64
#-------------------------------------------------------
load("GASTURBINE.Rdata")
rpm <- GASTURBINE$RPM
cpratio <- GASTURBINE$CPRATIO
inlettemp <- GASTURBINE$INLETTEMP
exhtemp <- GASTURBINE$EXHTEMP
airflow <- GASTURBINE$AIRFLOW
heatrate <-  GASTURBINE$HEATRATE
GASTURBINE.complete.lm<- lm(heatrate~rpm+cpratio+I(rpm*cpratio)+I(rpm^2)+I(cpratio^2))
GASTURBINE.reduced.lm<- lm(heatrate~rpm+cpratio)
anova(GASTURBINE.reduced.lm, GASTURBINE.complete.lm, test= "F")