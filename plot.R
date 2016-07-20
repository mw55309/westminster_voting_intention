
# source http://ukpollingreport.co.uk/voting-intention-2

d <- read.table("polls.txt", sep="\t", header=TRUE)

d[is.na(d)] <- -50

par(mar=c(10,4,2,1))
plot(1:nrow(d), smooth(rev(d[,3])), type="l", lwd=3, col="blue", ylim=c(0,50), xaxt="n", xlab="", ylab="percentage")
lines(1:nrow(d), smooth(rev(d[,4])), lwd=3, col="red")
lines(1:nrow(d), smooth(rev(d[,5])), lwd=3, col="orange")
lines(1:nrow(d), smooth(rev(d[,6])), lwd=3, col="purple")
title("Westminster voting intention")


cl <- nrow(d) - c(1905,1557,1183,780,515,50)
yr <- c(2011,2012,2013,2014,2015,2016)

ev <- nrow(d) - c(91,78)
ti <- c("2015 General Election","Corbyn began leadership")

axis(side=1, at=cl, lab=yr, las=2, cex.axis=0.9)
axis(side=1, at=ev, lab=ti, las=2, cex.axis=0.9)


for (i in cl) {
	lines(c(i,i), c(0,100), col="grey", lwd=1, lty=3)
}

for (i in ev) {
	lines(c(i,i), c(0,100), col="black", lwd=1, lty=3)
}


legend(250, 30, fill=c("red","blue","orange","purple"), legend=c("saviours","twats","nice but dim","racists"))

