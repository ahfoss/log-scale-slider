library(datasets)
library(manipulate)

xx <- as.numeric(EuStockMarkets[,'CAC'])
len <- length(xx)

yearInds <- round(cumsum(c(125,rep(260,6))))
yearNames <- 1992:1998
linSpaces <- (1:len)
linTicks <- cumsum(linSpaces)
quadSpaces <- linSpaces^2
quadTicks <- cumsum(quadSpaces)

par(mfrow=c(3,1))
plot(1:len, xx,type='l',xaxt='n')
axis(side=1,at=yearInds,labels=yearNames)
plot(linTicks,xx,type='l',xaxt='n')
axis(side=1,at=linTicks[yearInds],labels=yearNames)
#plot(quadTicks,xx,type='l',xaxt='n')
#axis(side=1,at=quadTicks[yearInds],labels=yearNames)

manipulate(
  {
    expTicks <- cumsum(expFactor^seq(1,10,length.out=len))
    plot(expTicks,xx,type='l',xaxt='n')
    axis(side=1,at=expTicks[yearInds],labels=yearNames)
  },
  expFactor = slider(0.8,2)
)



