# #step wise method

# 1.a
# data =read.table("HCH6Data.txt", header = FALSE)
# y= data$V1
# x1 = data$V2
# x2 = data$V3
# x3 = data$V4
# x4 = data$V5
# x5 = data$V6
# #step 1
# m1 = lm(y~x1)
# m2 = lm(y~x2)
# m3 = lm(y~x3)
# m4 = lm(y~x4)
# m5 = lm(y~x5)
# summary(m1)[["coefficients"]][, "t value"]
# summary(m2)[["coefficients"]][, "t value"]
# summary(m3)[["coefficients"]][, "t value"]
# summary(m4)[["coefficients"]][, "t value"]
# summary(m5)[["coefficients"]][, "t value"]
# summary(m1)
# #step 2
# m1=lm(y~x1 +x2)
# m2=lm(y~x1 +x3)
# m3=lm(y~x1 +x4)
# m4=lm(y~x1 +x5)
# summary(m1)[["coefficients"]][, "t value"]
# summary(m2)[["coefficients"]][, "t value"]
# summary(m3)[["coefficients"]][, "t value"]
# summary(m4)[["coefficients"]][, "t value"]
# summary(m3)
# #step 3
# m1=lm(y~x1 + x3 + x2)
# m2=lm(y~x1 + x3 + x4)
# m3=lm(y~x1 + x3 + x5)
# summary(m1)[["coefficients"]][, "t value"]
# summary(m2)[["coefficients"]][, "t value"]
# summary(m3)[["coefficients"]][, "t value"]
# m1 = lm(y~x1+x3)
# summary(m1)

#1.b

# # cp method
# hwdata =read.table("HCH6Data.txt", header = FALSE)
# y=  hwdata$V1
# x1 = hwdata$V2
# x2 = hwdata$V3
# x3 = hwdata$V4
# x4 = hwdata$V5
# x5 = hwdata$V6

# library(leaps)
# cpMeth <- regsubsets(V1~., data = hwdata, nbest =1,method = "exhaustive")
# cpMeth.summary = summary(cpMeth)
# plot(cpMeth.summary$cp, type = "b" ,xlab="number of variables", ylab = "Cp value")
# cpMeth.summary$cp

# MSE=(summary(mt)$sigma)^2
# "Number of Var,   Cp Stat"
# "Step 1 : Single Variable Models"
# m1 = lm(y~x1)
# m2 = lm(y~x2)
# m3 = lm(y~x3)
# m4 = lm(y~x4)
# m5 = lm(y~x5)
# extractAIC(m1,scale=MSE)
# extractAIC(m2,scale=MSE)
# extractAIC(m3,scale=MSE)
# extractAIC(m4,scale=MSE)
# extractAIC(m5,scale=MSE)
# "Step 2 : Two Variable Models"
# m1 = lm(y~x1 + x2)
# m2 = lm(y~x1 + x3)
# m3 = lm(y~x1 + x4)
# m4 = lm(y~x1 + x5)
# m5 = lm(y~x2 + x3)
# m6 = lm(y~x2 + x4)
# m7 = lm(y~x2 + x5)
# m8 = lm(y~x3 + x4)
# m9 = lm(y~x3 + x5)
# m10 = lm(y~x4 + x5)
# extractAIC(m1,scale=MSE)
# extractAIC(m2,scale=MSE)
# extractAIC(m3,scale=MSE)
# extractAIC(m4,scale=MSE)
# extractAIC(m5,scale=MSE)
# extractAIC(m6,scale=MSE)
# extractAIC(m7,scale=MSE)
# extractAIC(m8,scale=MSE)
# extractAIC(m9,scale=MSE)
# extractAIC(m10,scale=MSE)
# "Step 3 : Three Variable Models"
# m1 = lm(y~x1 + x2 + x3)
# m2 = lm(y~x1 + x2 + x4)
# m3 = lm(y~x1 + x2 + x5)
# m4 = lm(y~x1 + x3 + x4)
# m5 = lm(y~x1 + x3 + x5)
# m6 = lm(y~x1 + x4 + x5)
# m7 = lm(y~x2 + x3 + x4)
# m8 = lm(y~x2 + x3 + x5)
# m9 = lm(y~x2 + x4 + x5)
# m10 = lm(y~x3 + x4 + x5)
# extractAIC(m1,scale=MSE)
# extractAIC(m2,scale=MSE)
# extractAIC(m3,scale=MSE)
# extractAIC(m4,scale=MSE)
# extractAIC(m5,scale=MSE)
# extractAIC(m6,scale=MSE)
# extractAIC(m7,scale=MSE)
# extractAIC(m8,scale=MSE)
# extractAIC(m9,scale=MSE)
# extractAIC(m10,scale=MSE)
# "The minimum value calculated is not lower than the previous step, so we can stop"
# "For sake of being verbose, we will calculate the other values"
# "Step 4 : Four Variable Models"
# m1 = lm(y~x1 + x2 + x3 +x4)
# m2 = lm(y~x1 + x2 + x3 +x5)
# m3 = lm(y~x1 + x2 + x4 +x5)
# m4 = lm(y~x1 + x3 + x4 +x5)
# m5 = lm(y~x2 + x3 + x4 +x5)
# extractAIC(m1,scale=MSE)
# extractAIC(m2,scale=MSE)
# extractAIC(m3,scale=MSE)
# extractAIC(m4,scale=MSE)
# extractAIC(m5,scale=MSE)
# "Step 5"
# m1 = lm(y~x1 + x2 + x3 + x4 +x5)
# extractAIC(m1 , scale = MSE)
# "summary"
# "best model with respect to Cp Value"
# "y~x1+x3"
# m1 = lm(y~x1 + x3)
# summary(m1)
# extractAIC(m1, scale = MSE)

#2.a

# #stepwise through R
# model = lm(V1~.-V1, data=hwdata)
# library(olsrr)
# ols_stepwise(model, prem = 0.15, pent = 0.15, details = TRUE)

#2.b

# #Cp through R
# library(olsrr)
# model = lm(V1~.-V1, data=hwdata)
# ols_all_subset(model)
# k = ols_all_subset(model)
# k
# plot(k)
