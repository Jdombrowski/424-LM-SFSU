# Q4
load("MOISSANITE.Rdata")
View(MOISSANITE)
model = lm(MOISSANITE$VOLUME~MOISSANITE$PRESSURE)
plot(model, which = 1:1)
resid(model)
sum(residuals(model))
model2 = lm(MOISSANITE$VOLUME~MOISSANITE$PRESSURE+I(MOISSANITE$PRESSURE^2))
plot(model2,which = 1:1)

# Q11
load("GASTURBINE.Rdata")
View(GASTURBINE)
heatrate= GASTURBINE$HEATRATE
rpm = GASTURBINE$RPM
cpratio = GASTURBINE$CPRATIO
model = lm(heatrate~cpratio+rpm+I(cpratio*rpm))
summary(model)
model = lm(heatrate~cpratio+rpm)
plot(model, which = 1:1)
model = lm(heatrate~cpratio+rpm+I(cpratio*rpm))
plot(model, which = 1:2)

GASTURBINE
trimmedData = GASTURBINE[-11,]
model = lm(trimmedData$HEATRATE~trimmedData$CPRATIO+trimmedData$RPM+I(trimmedData$CPRATIO*trimmedData$RPM), data = trimmedData)
plot(model, which = 2:2)

trimmedData = GASTURBINE[c(-11,-36),]
model = lm(trimmedData$HEATRATE~trimmedData$CPRATIO+trimmedData$RPM+I(trimmedData$CPRATIO*trimmedData$RPM), data = trimmedData)
plot(model, which = 2:2)

trimmedData = GASTURBINE[c(-11,-36, -64),]
model = lm(trimmedData$HEATRATE~trimmedData$CPRATIO+trimmedData$RPM+I(trimmedData$CPRATIO*trimmedData$RPM), data = trimmedData)
plot(model, which = 2:2)

trimmedData = GASTURBINE
model = lm(trimmedData$HEATRATE~trimmedData$CPRATIO+trimmedData$RPM, data = trimmedData)
plot(model, which = 2:2)
trimmedData = GASTURBINE[c(-11,-64,-36),]
model = lm(trimmedData$HEATRATE~trimmedData$CPRATIO+trimmedData$RPM, data = trimmedData)
summary(model)
plot(model, which = 2:2)

#Q 26
load("GFCLOCKS.Rdata")
View(GFCLOCKS)
model = lm(GFCLOCKS$PRICE~GFCLOCKS$AGE+GFCLOCKS$NUMBIDS)
summary(model)
residuals(model)
sum(residuals(model))/32
var(residuals(model))
var(GFCLOCKS$PRICE)
var(residuals(model))/var(GFCLOCKS$PRICE)
cooks.distance(model)
plot(model, which =5)
s = sigma(model)
s
2*s
3*s
max(abs(residuals(model)))
influence.measures(model)