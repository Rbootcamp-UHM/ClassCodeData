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
square(m) # (still element by element)

# Will it work on a dataframe?

d <- data.frame( names=c("a", "b", "c"), size=1:3)
d
square(d)

# kind of. It throws a warning for the non-numerical columns. Better to leave it off as so:

square(d[-1])

# or maybe 

data.frame( d, square(d[-1]))

# This is a simple example, but you can see that you can put functions inside of functions. This makes your code reusable. Other benefits include making your code more readable. Also if you change your code, you only have to error check the function itself, not every single copy where youʻve used it. It reduces error. 

# Use in a quadratic equation:

x <- 1:50
2*square(x) - 3*x + 5

# Here is another cute base R function, curve. It will plot a function over a range of values. Here am plotting our function over the x limits 0 to 2:
 
curve(2*square(x) - 3*x + 5, xlim=c(0,2))

# When do you write a function? A good time might be when you notice that you write the same code over and over:

2*2
123*123
6702*6702
square(6702)
