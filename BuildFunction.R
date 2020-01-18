## How to build a function
## Suppose we want to write a function for average:

ssum <- sum(1:5) # make sure each line of code works
n <- length(1:5) # as expected
avg <- ssum/n

ssum <- sum(50:100) # when you notice that you do it again
n <- length(50:100) # itʻs time to make a function
avg <- ssum/n

ssum <- sum(-1:-3) # etc.
n <- length(-1:-3)
avg <- ssum/n

## Use the function() function to create a custom 
## function. Put your working code between { } on 
## separate lines, put arguments between (), and give
## your functin a name.
## Use the return() function to return a value/object. 

avg <- function( x ){  
	ssum <- sum(x)
	n <- length(x)
	average <- ssum/n
	return(average)
}

