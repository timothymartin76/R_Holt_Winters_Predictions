## Read in data
mydata<- read.csv(file.choose(), header=TRUE)
head(mydata)


##Convert to time series. Frequency is 12 for monthly data. Starting March 2003
mydata2<- ts(mydata$Volume, frequency=12, start=c(2003,3))
mydata2


##Plot the data
plot.ts(mydata2, xlab="Year", ylab="Volume")


## Use estimated HoltWinters function good model for forecasting historical time-series data with seasonal effect
HW2<- HoltWinters(mydata2)
HW2


##Plot the fitted values
plot.ts(mydata2, xlab="Year", ylab="Volume")
lines(HW2$fitted[,1], lty=2, col="red")


##Predict the future values - 24 periods into the future
HW2.pred<- predict(HW2, 24, prediction.interval=TRUE)


##Plot the predictions for the estimated model - blue is fitted, seagreen are prediction bands
plot.ts(mydata2, xlab="Year", ylab="Volume", xlim=c(2003, 2017))
lines(HW2$fitted[,1], lty=2, col="red")
lines(HW2.pred[,1], col="blue")
lines(HW2.pred[,2], col="seagreen", lty=2)
lines(HW2.pred[,3], col="seagreen", lty=2)
