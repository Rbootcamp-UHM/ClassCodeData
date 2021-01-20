## How to code a function in R to accept user-specified functions in 
## symbolic notation for execution
## use "eval()" within a function definition
#
# Must assign x within function or it doesn't get passed to local scope

funkx <- function( expression, x ) {
	  x <- x             ## assignment inside function introduces x to local scope
	  y <- eval(expression)            
	  return(y)  
}

plotfunkx <- function( expression, x) {
	y <- funkx ( expression, x )
	plot(x,y, type="l")
    return(y)
}
## Examples: 

funkx(x+1, x<-1:10)
funkx(x^3+1, x<-1:5)
funkx(2^x, x<-1:8)     
funkx(sin(x), x<-1:100*.1)# etc.

plotfunkx(sin(x), x<-1:100*.1)# etc.
plotfunkx(2^x, x<-1:8)# etc.