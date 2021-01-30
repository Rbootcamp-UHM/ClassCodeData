############################################
#
#  Riffing off of the example of simulated data:    y = 2*x + error 
#  Letʻs calculate a 95% CI for the correlation based on 
#  1000 bootstrap resamples
#
############################################

## Step 5  Bootstrap resampling to get 95% CI of one dataset

#### Now simulate one sample, and calculate a bootstrap 95% confidence 
#### interval of the correlation based on 1000 resamples

### function definitions ###################################

make_data <- function( n=30, slope=2) {
	x <- rnorm( 30 )
	y <- 2*x + rnorm(30)
	return( data.frame(x,y)	)
}

## Sample the rows of dat with replacement to create a bootstrap dataset
draw_bootstrap <- function( dat ) {
	ii <- sample(1:nrow(dat), nrow(dat), replace=TRUE)
	return( dat[ii,] )
}

### Start of execution ###################################

dat <- make_data(30) ## make one dataset

					## Create bootstrap samples by resampling the
					## original dataset 1000 times, with replacement
sample_list <- lapply( 1:1000, function(X) { draw_bootstrap(dat) })

					## Compute correlations for each dataset
correlations <- sapply( sample_list, function(X)  cor(X$x, X$y) )
print(correlations, digits=4)

					## Compute mean of correlations and get 95% CI
mean(correlations)  # mean correlation 0.87
CI_lower <- sort(correlations)[25]  # 0.76
CI_upper <- sort(correlations)[975]  #0.93

# Therefore our best estimate of the correlation is 0.87, 
# with 95% CI (0.76, 0.93)

					## Make a plot - show with density()
plot(density(correlations))   # the probability density of the means
abline( v=mean(correlations) )  			# make a black line at the mean
abline( v=CI_lower, lty=3, col="blue" )  # blue dotted line at the lower CI
abline( v=CI_upper, lty=3, col="blue" )  # blue dotted line at the upper CI  

## The true mean falls within CI with 95% confidence


