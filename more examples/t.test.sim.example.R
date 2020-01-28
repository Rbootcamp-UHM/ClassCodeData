# A simulated example of the effect of a carrier on phenotype y
# We generate a null distribution of the phenotypes under the 
# null hypothesis of no effect, versus an alternative with 
# carriers having an increase in mean of 0.5
# We simulate distributions and compare differences between
# carriers and non-carriers

## Testing our hypothesis involves comparing the differences we
## observed between carriers and non-carriers versus the 
## differences we observe with simulation to see how extreme the
## observed differences are

carrier<-rep(c(0,1), c(100,200)) 
null.y<-rnorm(300) 
alt.y<-rnorm(300, mean=carrier/2)

t.test(null.y~carrier, var.equal=TRUE)
t.test(alt.y~carrier, var.equal=TRUE)

## The test statistic - the observed difference with null
## the observed difference with alternative distribution
null.diff<-mean(null.y[carrier==1])-mean(null.y[carrier==0]) 
alt.diff<-mean(alt.y[carrier==1])-mean(alt.y[carrier==0])

one.test <- function(x,y) { 
	xstar<-sample(x)
	mean(y[xstar==1])-mean(y[xstar==0]) 
	}
	
# replicate is a wrapper for sapply. Runs one.test 1000 times	
test.null <- replicate(1000, one.test(carrier, null.y))
test.alt <- replicate(1000, one.test(carrier, alt.y))

hist(test.null) 
abline(v=null.diff, lwd=2, col="purple") 
mean(abs(test.null) > abs(null.diff))

hist(test.alt) 
abline(v=alt.diff, lwd=2, col="purple") 
mean(abs(test.alt) > abs(alt.diff))
