
#Dombrowski HCH5 R Source code

# # Q 8
load("GASTURBINE.Rdata")
rpm <- GASTURBINE$RPM
cpratio <- GASTURBINE$CPRATIO
inlettemp <- GASTURBINE$INLETTEMP
exhtemp <- GASTURBINE$EXHTEMP
airflow <- GASTURBINE$AIRFLOW
heatrate <-  GASTURBINE$HEATRATE

# plot(heatrate~rpm, main = "Q8 HeatRate vs. RPM for model building")
# plot(heatrate~inlettemp, main = "Q8 HeatRate vs. inletTemperature for model building")
# plot(heatrate~exhtemp, main = "Q8 HeatRate vs. Exhaust Temperature for model building")
# plot(heatrate~airflow)

# m1 = lm(heatrate~rpm)
# summary(m1)
# m1.1 = lm(heatrate~rpm +I(rpm**2))
# summary(m1.1)
# m2 = lm(heatrate~rpm + inlettemp)
# summary(m2)
# m2.2 = lm(heatrate~rpm + inlettemp +I(inlettemp**2))
# summary(m2.2)
# #predicted model from the graphs
# predlm = lm(heatrate~rpm + I(inlettemp**2)+I(exhtemp**2)+I(cpratio**2)+I(airflow**2))

# # q 16 
# # using minitab in the book
# load("STREETVN.Rdata")
# View(STREETVN)
# earnings = STREETVN$EARNINGS
# age = STREETVN$AGE
# hours = STREETVN$HOURS
# STREETVN.lm = lm(earnings~age+hours+I(age*hours)+I(age**2)+I(hours**2))
# STREETVN.reduced.lm = lm(earnings~age+hours)
# anova(STREETVN.lm, STREETVN.reduced.lm)

# q 22
# load("WAFER.Rdata")
# View(WAFER)
# temp = WAFER$TEMP
# failtime = WAFER$FAILTIME
# plot(failtime~temp)
# wafer.lm = lm(failtime~temp)
# summary(wafer.lm)
# wafer.lm = lm(failtime~temp + I(temp**2))
# summary(wafer.lm)
# wafer.lm = lm(failtime~temp + I(temp**2))
# summary(wafer.lm)temp = WAFER$TEMP
# temp.norm = scale(temp)
# wafer.scaled.lm = lm(failtime~temp.norm + I(temp.norm**2))
# summary(wafer.lm)
# summary(wafer.scaled.lm)
# anova(wafer.lm, wafer.scaled.lm)
#Q 26

# # #Q 34
load("GASTURBINE.Rdata")
View(GASTURBINE)
rpm <- GASTURBINE$RPM
cpratio <- GASTURBINE$CPRATIO
inlettemp <- GASTURBINE$INLETTEMP
exhtemp <- GASTURBINE$EXHTEMP
airflow <- GASTURBINE$AIRFLOW
heatrate <-  GASTURBINE$HEATRATE
# engine <- GASTURBINE$ENGINE
# levels(engine)
# engineAdv = engineAero = engine
# levels(engineAdv)= c(1,0,0)
# levels(engineAero)= c(0,1,0)
# GASTURBINE.lm <- lm(heatrate~rpm + cpratio + rpm*cpratio + I(rpm**2) + I(cpratio**2) + engineAdv + engineAero)
# GASTURBINE.reduced.lm <- lm(heatrate ~ rpm + cpratio)
# anova(GASTURBINE.reduced.lm, GASTURBINE.lm)

# plot(heatrate~rpm, main="HeatRate vs. rpm, keeping cpratio at avg value 14.7")
# s1 <- seq(min(rpm), max(rpm), length.out  = 59)
# lines(s1, predict(GASTURBINE.lm,newdata = data.frame(rpm=s1,cpratio = 14.7,engineAdv="1", engineAero="0")), lty=2, col = "green")
# lines(s1, predict(GASTURBINE.lm,newdata = data.frame(rpm=s1,cpratio = 14.7,engineAdv="0", engineAero="1")), lty=2, col = "red")
# lines(s1, predict(GASTURBINE.lm,newdata = data.frame(rpm=s1,cpratio = 14.7,engineAdv="0", engineAero="0")), lty=2, col = "blue")
# legend(5000,16000 , legend=c("Adv" , "Aero" , "Traditional"), col = c("green","red","blue"), lty=1:2, cex =0.8, title= "Line Types", bg= "white")

# plot(heatrate~cpratio, main="HeatRate vs. cpratio, keeping rpm at avg value 8326")
# s <- seq(min(cpratio), max(cpratio), length.out  = 59)
# lines(s, predict(GASTURBINE.lm,newdata = data.frame(rpm=8326.6,cpratio = s,engineAdv="1", engineAero="0")), lty=2, col = "green")
# lines(s, predict(GASTURBINE.lm,newdata = data.frame(rpm=8326.6,cpratio = s,engineAdv="0", engineAero="1")), lty=2, col = "red")
# lines(s, predict(GASTURBINE.lm,newdata = data.frame(rpm=8326.6,cpratio = s,engineAdv="0", engineAero="0")), lty=2, col = "blue")
# legend(20,16000 , legend=c("Adv" , "Aero" , "Traditional"), col = c("green","red","blue"), lty=1:2, cex =0.8, title= "Line Types", bg= "white")
# library(scatterplot3d)
# scatter3D(rpm,cpratio, heatrate, phi= 10, theta =45, main="All engines", xlab = "rpm", zlab="heatrate", ylab="cpratio")
