GenderEmploy <- read.csv(file.choose())
View(GenderEmploy)
str(GenderEmploy)
female <- GenderEmploy$unemp.female
male <- GenderEmploy$unemp.male
boxplot(GenderEmploy, names=c("Female","Male"), col = "green", ylab="Unemployed .000s")
plot(female, male, xlab ="Male Unemployed(000's)", ylab="Female Unemployed (000's)")
par(mfrow=c(1,2))
qqnorm(female)
qqline(female)
qqnorm(male)
qqline(male)
par(mfrow=c(1,2))
hist(female, col = "pink", xlab = "Female Unemployed")
hist(male, col="light blue", xlab = "Male Unemployed")
zt.test = t.test(female, male, data=GenderEmploy, conf.level = 0.95, var.equal=T, alternative="two.sided")
zt.test
plot(density(female), xlab = "Female & Male Unemployed")
lines(density(male), col = "red", xlab = "Male Unemployed", lty=2)
plot(density(male))
zmodel <- lm(female ~ male, data=GenderEmploy)
summary(zmodel)
residuals <- resid(zmodel)
qqnorm(residuals)
qqline(residuals)
female.fitted <- predict(zmodel)
par(mar=par()$mar + c(0,1,0,0)) 
plot(female.fitted, GenderEmploy$female, xlab="Fitted values of\nfemale Unemployed (000's)", ylab="Actual values of\nfemale Unemployed (000's)")
abline(0,1, lty=2)
plot(female.fitted, residuals, xlab="Fitted Female Unemployed (000's)", ylab="Residual (ooo's)")
abline(h=0, lty=2)
plot(residuals, type='b', ylab="Residual")
abline(h=0, lty=2, col='grey')
summary(zmodel)


