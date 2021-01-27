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
	
paint.iris(iris, iris$Species)

sp <- sample(iris$Species)
	icol[sp=="setosa"] <- "red"
	icol[sp=="versicolor"] <-"purple"
	icol[sp=="virginica"] <- "turquoise"
	plot(iris[, -5], col=icol)

sp <- sample(iris$Species)
	icol[sp=="setosa"] <- "red"
	icol[sp=="versicolor"] <-"purple"
	icol[sp=="virginica"] <- "turquoise"
	plot(iris[, -5], col=icol)

sp <- sample(iris$Species)
	icol[sp=="setosa"] <- "red"
	icol[sp=="versicolor"] <-"purple"
	icol[sp=="virginica"] <- "turquoise"
	plot(iris[, -5], col=icol)


paint.iris ( dat=iris[-5], sp=iris$Species )

paint.iris <- function(dat, sp ) {  # paint.iris accepts a dataframe and a species vector
	
	spp <- sample(sp)
	icol[spp=="setosa"] <- "red"
	icol[spp=="versicolor"] <-"purple"
	icol[spp=="virginica"] <- "turquoise"
	plot(dat, col=icol)
	
}

paint.iris ( dat=iris[-5], sp=iris$Species )


# paint.iris accepts a dataframe and a species vector
paint.iris <- function(dat=iris[-5], sp=iris$Species ) {  	
    icol <- as.character(sp)
	icol[sp=="setosa"] <- "red"
	icol[sp=="versicolor"] <-"purple"
	icol[sp=="virginica"] <- "turquoise"
	plot(dat, col= icol)
	
}

paint.iris ( dat=iris[-5], iris$Species )

sp <- sample(iris$Species)
paint.iris ( dat=iris[-5], sp )

paint.iris ( dat=iris[-5], sample(iris$Species) )


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



simple.plot <- function(dat=iris[-5], sp=iris$Species, ... ){ 
  sp <- as.character(sp)
  sp[sp == "a"] <- "red"                   # what can you make generic (= reusable?)
  sp[sp == "b"] <- "blue"
  plot(dat, col=sp, ...)
  	
}

simple.plot( ir[-3], ir$species)

paint.iris( iris[-5],     )   # how is this maximally reusable? 


sp <- sample(sp)
sp[sp == "a"] <- "red"
sp[sp == "b"] <- "blue"
plot(ir[-3], col=sp, pch=16)

dat <- data.frame(ir[-3], sp)
write.csv(dat, file="dat1.csv" )

sp <- sample(sp)
sp[sp == "a"] <- "red"
sp[sp == "b"] <- "blue"
plot(ir[-3], col=sp, pch=16)

dat <- data.frame(ir[-3], sp)
write.csv(dat, file="dat1.csv" )


sp <- sample(sp)
sp[sp == "a"] <- "red"
sp[sp == "b"] <- "blue"
plot(ir[-3], col=sp, pch=16)

dat <- data.frame(ir[-3], sp)
write.csv(dat, file="dat2.csv" )


sp <- sample(sp)
sp[sp == "a"] <- "red"
sp[sp == "b"] <- "blue"
plot(ir[-3], col=sp, pch=16)

dat <- data.frame(ir[-3], sp)
write.csv(dat, file="dat3.csv" )




	write.csv(dat, file="out1.csv")
	write.csv(dat, file="out2.csv")
	write.csv(dat, file="out3.csv")
	# ...
	write.csv(dat, file="out10.csv")


files <- paste("out", 1:10, ".csv", sep="")


# How to save the output to file?

sp <- sample(sp)
sp[sp == "a"] <- "red"
sp[sp == "b"] <- "blue"
plot(ir[-3], col=sp, pch=16)

dat <- data.frame(ir[-3], sp)
write.csv(dat, file="dat3.csv" )

out <- dat

for (i in 1:10  ) {
	
	write.csv(out, file= files[i])    # how can we replace the filename?
}

### Can we save the data to save as output after randomizing?
## The original simple.plot function

simple.plot <- function(dat, sp, ... ){ 
  sp <- as.character(sp)
  sp[sp == "a"] <- "red"                   # what can you make generic (= reusable?)
  sp[sp == "b"] <- "blue"
  plot(dat, col=sp, ...)
}


### What do we want to save?

simple.plot <- function(dat, sp, ... ){ 
  sp <- as.character(sp)
  sp[sp == "a"] <- "red"                   # what can you make generic (= reusable?)
  sp[sp == "b"] <- "blue"
  plot(dat, col=sp, ...)
  dat <- cbind(dat,sp)
  return(dat)	
}


simple.plot(ir[-3], ir$species)


for (i in 1:10  ) {
	
	out <- simple.plot(ir[-3], ir$species)
	write.csv(out, file= files[i])    # how can we replace the filename?
}

# make a subdirectory and put files in there
## Make a folder "out" in your working directory

for (i in 1:10  ) {
	
	out <- simple.plot(ir[-3], ir$species)
	write.csv(out, file= paste("out/", files[i], sep=""  ))    # now going to out/out1.csv, etc.
}



### Reading in sequences from GenBank

require(ape)  # install ape if you need to
?read.GenBank

ref <- c("U15717", "U15718", "U15719", "U15720",
         "U15721", "U15722", "U15723", "U15724")
Rampho <- read.GenBank(ref)
str(Rampho)
desc <- attr(Rampho, "description")
write.FASTA(Rampho, file="Rampho.fasta")
write.csv(desc, file="Rampho.desc.csv", row.names=F)

# parse desc, save bits of info 

ll <- strsplit(desc, ",")

