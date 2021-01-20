## How to build a function
## Suppose we want to write a function for square:

x <- 10
xsq <- 10*10

## Use the function() function to create a custom 
## function. Put your working code between { } on 
## separate lines, put arguments between (), and give
## your functin a name.
## Use the return() function to return a value/object. 

square <- function( x ) {
  return ( x*x )
}

# It is always good to show some examples

square( 10 )

# How it works on a vector

x <- 1:6
square(x) # (element by element)

# How it works on a matrix

m <- matrix(x, nrow=2)
m
square(m)

