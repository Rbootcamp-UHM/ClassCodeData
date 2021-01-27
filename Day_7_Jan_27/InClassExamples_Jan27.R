###   How to build a function

## Right - runs without errors, give the correct answers
## Repeatable
## Reusable
## Readable

paint.iris <- function(iris, sp) { 
	icol <- c(iris$Species)
	sp <- iris$Species
	icol[sp=="setosa"] <- "red"
	icol[sp=="versicolor"] <-"purple"
	icol[sp=="virginica"] <- "turquoise"
	plot(iris[, -5], col=icol)
	}
	
paint.iris(iris, sp)

### You want to use generic names inside of functions, because they are just containers for your information. In order to be reusable, it should work on any data that you pass to it

### instead of writing the function all at once, first just repeat the code to see the pattern


x <- rnorm(10)
y <- rnorm(10)
species <- c("a", "a", "a", "b", "b")
ir <- data.frame(x, y, species=factor(species))

plot(ir[-3], col=ir$species, pch=16)

sp <- as.character(ir$species)
sp[sp == "a"] <- "red"
sp[sp == "b"] <- "blue"
plot(ir[-3], col=sp, pch=16)

sp <- sample(sp)
sp[sp == "a"] <- "red"
sp[sp == "b"] <- "blue"
plot(ir[-3], col=sp, pch=16)

sp <- sample(sp)
sp[sp == "a"] <- "red"
sp[sp == "b"] <- "blue"
plot(ir[-3], col=sp, pch=16)

sp <- sample(sp)                         # What is changing? What stays the same?
sp[sp == "a"] <- "red"                   # what can you make generic (= reusable?)
sp[sp == "b"] <- "blue"
plot(ir[-3], col=sp, pch=16)



function(dat, sp){ 
  sp[sp == "a"] <- "red"                   # what can you make generic (= reusable?)
  sp[sp == "b"] <- "blue"
  plot(dat, col=sp, pch=16)
  	
}

paint.iris( iris[-5],     )   # how is this maximally reusable? 


sp <- sample(sp)
sp[sp == "a"] <- "red"
sp[sp == "b"] <- "blue"
plot(ir[-3], col=sp, pch=16)

dat <- data.frame(ir[-3], sp)
write.csv(dat, file="dat1.csv" )


	write.csv(dat, file="out1.csv")
	write.csv(dat, file="out2.csv")
	write.csv(dat, file="out3.csv")
	write.csv(dat, file="out10.csv")


files <- paste("out", 1:10, ".csv", sep="")

for (i in   ) {
	write.csv(dat, file=   )    # how can we replace the filename?
}

# make a subdirectory and put files in there

