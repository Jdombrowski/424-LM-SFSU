# testing forward regression selection
load("GjASTURBINE.Rdata")
View(GASTURBINE)
rpm <- GASTURBINE$RPM
cpratio <- GASTURBINE$CPRATIO
inlettemp <- GASTURBINE$INLETTEMP
exhtemp <- GASTURBINE$EXHTEMP
airflow <- GASTURBINE$AIRFLOW
heatrate <-  GASTURBINE$HEATRATE
power <- GASTURBINE$POWER
x1 <- GASTURBINE$RPM
x2 <- GASTURBINE$CPRATIO
x3 <- GASTURBINE$INLETTEMP
x4 <- GASTURBINE$EXHTEMP
x5 <- GASTURBINE$AIRFLOW
x6 <- GASTURBINE$POWER
y <-  GASTURBINE$HEATRATE
fit = lm(y~x1+x2+x3+x4+x5+x6)
m1.1 = lm(y~x1)
m1.2 = lm(y~x2)
m1.3 = lm(y~x3)
m1.4 = lm(y~x4)
m1.5 = lm(y~x5)
m1.6 = lm(y~x6)
summary(m1.1)[["coefficients"]][, "t value"]
summary(m1.2)[["coefficients"]][, "t value"]
summary(m1.3)[["coefficients"]][, "t value"]
summary(m1.4)[["coefficients"]][, "t value"]
summary(m1.5)[["coefficients"]][, "t value"]
summary(m1.6)[["coefficients"]][, "t value"]
#select x1 , t-val = 12.69
# update model
m2.1=lm(y~x1 + x2)
m2.2=lm(y~x1 + x3)
m2.3=lm(y~x1 + x4)
m2.4=lm(y~x1 + x5)
m2.5=lm(y~x1 + x6)
summary(m2.1)[["coefficients"]][, "t value"]
summary(m2.2)[["coefficients"]][, "t value"]
summary(m2.3)[["coefficients"]][, "t value"]
summary(m2.4)[["coefficients"]][, "t value"]
summary(m2.5)[["coefficients"]][, "t value"]
# select x3 , t-val = 8.97
m3.1=lm(y~x1+ x3 + x2)
m3.2=lm(y~x1+ x3 + x4)
m3.3=lm(y~x1+ x3 + x5)
m3.4=lm(y~x1+ x3 + x6)
summary(m3.1)[["coefficients"]][, "t value"]
summary(m3.2)[["coefficients"]][, "t value"]
summary(m3.3)[["coefficients"]][, "t value"]
summary(m3.4)[["coefficients"]][, "t value"]
#select x4 , t-val = 6.00
m4.1=lm(y~ x1 + x3 + x4 + x2)
m4.2=lm(y~ x1 + x3 + x4 + x5)
m4.3=lm(y~ x1 + x3 + x4 + x6)
summary(m4.1)
summary(m4.2)
summary(m4.3)

#select x5 , p-val = 0.057, t-val = 1.94
m5.1=lm(y~ x1 + x3 + x4 + x5 +x2)
m5.2=lm(y~ x1 + x3 + x4 + x5 +x6)
summary(m5.1)
summary(m5.2)

#select x6 p-val = 0.325
m6.1 = lm(y~ x1 + x3 + x4 + x5 + x6 + x2)
summary(m6.1)
#final model
summary(m5.2)
#stop, reject x2
#check work
fit = lm(y~x1+x2+x3+x4+x5+x6, data= GASTURBINE)
library(MASS)
step = stepAIC(fit, direction = "forward")
step$anova