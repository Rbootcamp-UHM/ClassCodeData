###   Demos - graphics package

require(graphics)
require("grDevices") # for colours

?graphics

demo(graphics)
demo(image)
demo(persp)



# plot densities of iris - PC1 vs. PC2

plot(iris[-5])

# Petal.Length   Sepal.Width
with(iris, plot(Petal.Length, Sepal.Width))

# Formula representation for specifying which numeric variables go into the PCA, follows the ~

pc.iris <- princomp (~ .-Species, data=iris, scores=T) 
# Same as 
# 		pc.iris <- princomp( ~  Petal.Length + Petal.Width + Sepal.Length + Sepal.Width, data=iris, scores=T)

## The important point for us is how to USE functions, what is the class of the inputs and outputs?

class(pc.iris)
str(pc.iris) 
?princomp   # returns a list of 7 objects, there is an accessor method to get the loadings()  

pc1 <- pc.iris$scores[,1]
pc2 <- pc.iris$scores[,2]
pc3 <- pc.iris$scores[,3]
plot(pc2 ~ pc1, col=iris$Species, cex=2, pch=16)

## Compare the two (original axes, pc axes)
with(iris, plot(Petal.Length, Sepal.Width))
plot(pc2 ~ pc1, col=iris$Species, cex=2, pch=16)
plot(pc3 ~ pc1, col=iris$Species, cex=2, pch=16)


## Plot the densities of the data along the PC axes

require(MASS)
iris.kde <- kde2d(pc1, pc2, n=100)  # plot the bivariate kernal density of Iris
image(iris.kde)
points(pc1, pc2)



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

