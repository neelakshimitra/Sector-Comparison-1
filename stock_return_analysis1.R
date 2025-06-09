library(quantmod)
# sector comparison- tech vs energy vs finance 
# choices: tech-NVDA(Nvidia), energy-XOM(ExxonMobil), finance- JPM(JPMorgan)

NVDA <- data.frame(getSymbols("NVDA", auto.assign = F))
colnames(NVDA) <- c("Open", "High", "Low", "Close", "Volume", "Adjusted")
head(NVDA)
tail(NVDA)


XOM <- data.frame(getSymbols("XOM", auto.assign = F))
colnames(XOM) <- c("Open", "High", "Low", "Close", "Volume", "Adjusted")
head(XOM)
tail(XOM)


JPM <- data.frame(getSymbols("JPM", auto.assign = F))
colnames(JPM) <- c("Open", "High", "Low", "Close", "Volume", "Adjusted")
head(JPM)
tail(JPM)

#graphs for closing prices and adjusted closing prices 
plot(Ad(NVDA), type = 'l')
plot(Cl(NVDA), type = 'l')

plot(Ad(XOM), type = 'l')
plot(Cl(XOM), type = 'l')

plot(Ad(JPM), type = 'l')
plot(Cl(JPM), type = 'l')


#calculating daily returns- using as.xts
dailyReturn(Ad(as.xts(NVDA)), type = 'arithmetic')
plot(dailyReturn(Ad(as.xts(NVDA)), type = 'arithmetic'), type = 'l', main = 'NVDA daily returns')

dailyReturn(Ad(as.xts(XOM)), type = 'arithmetic')
plot(dailyReturn(Ad(as.xts(XOM)), type = 'arithmetic'), type = 'l', main = 'XOM daily returns')

dailyReturn(Ad(as.xts(JPM)), type = 'arithmetic')
plot(dailyReturn(Ad(as.xts(JPM)), type = 'arithmetic'), type = 'l', main = 'JPM daily returns')

#cumulative returns
plot(cumprod(1 + dailyReturn(Ad(as.xts(NVDA)), type = 'arithmetic')),  main = 'NVDA cumulative returns')
plot(cumprod(1 + dailyReturn(Ad(as.xts(XOM)), type = 'arithmetic')), main = 'XOM cumulative returns')
plot(cumprod(1 + dailyReturn(Ad(as.xts(JPM)), type = 'arithmetic')), main = 'JPM cumulative returns')

#log returns 
plot(diff(log(Ad(NVDA))), type = 'l', main = 'NVDA log returns')
plot(diff(log(Ad(XOM))), type = 'l', main = 'XOM log returns')
plot(diff(log(Ad(JPM))), type = 'l', main = 'JPM log returns')


#comparing close to adjusted- NVDA
compareAdtoClNVDA <- data.frame(apply(apply(NVDA[,c("Close", "Adjusted")], 2, log), 2, diff))
compareAdtoClNVDA 
plot(compareAdtoClNVDA[,1], type = "l", main = 'compareAdtoCl-NVDA')
lines(compareAdtoClNVDA[,2], type = 'l', col = 'red') 

compareAdtoClCumSumNVDA <- data.frame(apply(compareAdtoClNVDA, 2, cumsum))
compareAdtoClCumSumNVDA
plot(compareAdtoClCumSumNVDA[,1], type = 'l')
lines(compareAdtoClCumSumNVDA[,2], type = 'l', col = 'red')


#comparing close to adjusted- XOM
compareAdtoClXOM <- data.frame(apply(apply(XOM[,c("Close", "Adjusted")], 2, log), 2, diff))
compareAdtoClXOM
plot(compareAdtoClXOM[,1], type = "l", main = 'compareAdtoCl-XOM')
lines(compareAdtoClXOM[,2], type = 'l', col = 'red') 

compareAdtoClCumSumXOM <- data.frame(apply(compareAdtoClXOM, 2, cumsum))
compareAdtoClCumSumXOM
plot(compareAdtoClCumSumXOM[,1], type = 'l')
lines(compareAdtoClCumSumXOM[,2], type = 'l', col = 'red')


#comparing close to adjusted- JPM
compareAdtoClJPM <- data.frame(apply(apply(JPM[,c("Close", "Adjusted")], 2, log), 2, diff))
compareAdtoClJPM
plot(compareAdtoClJPM[,1], type = "l", main = 'compareAdtoCl-JPM')
lines(compareAdtoClJPM[,2], type = 'l', col = 'red') 

compareAdtoClCumSumJPM <- data.frame(apply(compareAdtoClJPM, 2, cumsum))
compareAdtoClCumSumJPM
plot(compareAdtoClCumSumJPM[,1], type = 'l')
lines(compareAdtoClCumSumJPM[,2], type = 'l', col = 'red')


#difference between log returns and simple returns 
plot(cumprod(1 + dailyReturn(Ad(as.xts(NVDA)), type = 'arithmetic')), main = 'NVDA- log vs simple returns')
lines(cumsum(dailyReturn(Ad(as.xts(NVDA)), type = 'log')), col = 'red')

plot(cumprod(1 + dailyReturn(Ad(as.xts(XOM)), type = 'arithmetic')), main = 'XOM- log vs simple returns')
lines(cumsum(dailyReturn(Ad(as.xts(XOM)), type = 'log')), col = 'red')

plot(cumprod(1 + dailyReturn(Ad(as.xts(JPM)), type = 'arithmetic')), main = 'JPM- log vs simple returns')
lines(cumsum(dailyReturn(Ad(as.xts(JPM)), type = 'log')), col = 'red')


#moving on to using performance analytics 
library(PerformanceAnalytics)

NVDA_data <- as.xts(compareAdtoClNVDA)
NVDA_data
charts.PerformanceSummary(NVDA_data, main = 'NVDA-Close vs Adjusted Cumulative Discrete Return')

XOM_data <- as.xts(compareAdtoClXOM)
XOM_data
charts.PerformanceSummary(XOM_data, main = 'XOM-Close vs Adjusted Cumulative Discrete Return')

JPM_data <- as.xts(compareAdtoClJPM)
JPM_data
charts.PerformanceSummary(NVDA_data, main = 'JPM-Close vs Adjusted Cumulative Discrete Return')

#merging all three for comparison
merge(NVDA_data, XOM_data, JPM_data)
dim(merge(NVDA_data, XOM_data, JPM_data))

NDVAvsXOMvsJPM <- merge(NVDA_data, XOM_data, JPM_data)
colnames(NDVAvsXOMvsJPM) <- c("NVDA_Close", "NVDA_Adjusted", "XOM_Close", "XOM_Adjusted", "JPM_Close", "JPM_Adjusted")
NDVAvsXOMvsJPM 

charts.PerformanceSummary((NDVAvsXOMvsJPM ), main = 'NDVAvsXOMvsJPM ')

charts.PerformanceSummary(NDVAvsXOMvsJPM[, c("NVDA_Adjusted", "XOM_Adjusted", "JPM_Adjusted")], main = "Sector Comparison - Adjusted Log Returns")

# sharpe ratio
table.AnnualizedReturns(NDVAvsXOMvsJPM, scale =252, Rf= 0.0465/252)

table.Drawdowns(NDVAvsXOMvsJPM[, c("NVDA_Adjusted", "XOM_Adjusted", "JPM_Adjusted")])

