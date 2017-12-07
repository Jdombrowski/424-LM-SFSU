load("PONDICE.Rdata")
y = PONDICE$broadbandalb
x1 = PONDICE$depth
x2 = PONDICE$icetype

t1 = subset(PONDICE, icetype ==1 )
t2 = subset(PONDICE, icetype ==2 )
t3 = subset(PONDICE, icetype ==3 )

min(t1$depth)
max(t1$depth)
min(t2$depth)
max(t2$depth)
min(t3$depth)
max(t3$depth)

library(usdm)
temp = factor(PONDICE$icetype)
levels(temp) = c("not","1stYear","multiYear") 
PONDICE$icetype.f = factor(PONDICE$icetype)
test = data.frame(PONDICE$broadbandalb, PONDICE$depth, PONDICE$icetype.f)
vif(test)

#Q 19 
load("GASTURBINE.Rdata")
rpm <- GASTURBINE$RPM
cpratio <- GASTURBINE$CPRATIO
inlettemp <- GASTURBINE$INLETTEMP
exhtemp <- GASTURBINE$EXHTEMP
airflow <- GASTURBINE$AIRFLOW
heatrate <-  GASTURBINE$POWER
power =GASTURBINE$POWER


library(usdm)
data = data.frame(rpm,cpratio,inlettemp,exhtemp,airflow, power)
vif(data)
data = data.frame(rpm,cpratio,inlettemp,exhtemp,airflow)
vif(data)
data = data.frame(rpm,cpratio,exhtemp,airflow)
vif(data)
model = lm(heatrate~rpm+cpratio+exhtemp+airflow)

library(corrplot)
corrplot.mixed(cor(data.frame(heatrate,rpm,cpratio,exhtemp, airflow)))


model
summary(model)

library(olsrr)
model1 = lm(heatrate~rpm+cpratio+exhtemp, data = GASTURBINE)
ols_stepwise(model = model1, pent = 0.15, prem=0.15)
summary(model1)
model1

# Q 21

load("HAMILTON.Rdata")

y= HAMILTON$Y
x1=HAMILTON$X1
x2 = HAMILTON$X2
cor.test(y,x1)
cor.test(y,x2)
model = lm(y ~ x1 + x2 )
summary(model)

cor.test(x1,x2)

summary(lm(y~x1))
summary(lm(y~x2))

library(usdm)
vif(HAMILTON)