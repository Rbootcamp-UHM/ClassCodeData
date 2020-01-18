iris			# A built-in dataframe
dim(iris)	# dimensions
names(iris)
names(iris) <- c("sepalL", "sepalW",  "petalL", "petalW", "species")

## Accessing vectors within iris, saving as separate objects
species <- iris$species   
petalL <- iris$petalL
petalW <- iris$petalW
nrows <- dim(iris)[1]

oo <- sample(1:nrows)  ## scramble index order 
mixiris <- iris[oo,]   ## reorder iris, save as mixiris

colors <- rep("red", nrows)  ## create colors vector
spnames <- unique(species)  ## three species names

## use conditional on species name to change colors
colors[ species== spnames[2] ] <- "pink"  ## versicolor - pink
colors[ species== spnames[3] ] <- "purple" ## virginica purple


## using the old method first 50, next 50, last 50 doesnʻt
## work on mixiris
plot(mixiris$petalL, mixiris$petalW, col=c(rep("red", 50), rep("pink", 50), rep("purple", 50)), pch=16, cex=3)


## try new method of matching colors to species 
colors <- rep("red", nrows)  # creates color all red
spnames <- unique(mixiris$species). #grabs unique species
colors[ mixiris$species== spnames[2] ] <- "pink" # reassignes species 2 to color "pink"
colors[ mixiris$species== spnames[3] ] <- "purple"

## colors correct! Even for random order
plot(mixiris$petalL, mixiris$petalW, col=colors, pch=16, cex=3)

## reordering example with order 
oo <- order( mixiris$species) #sort by species name
mixiris[oo, ]
oo <- order( mixiris$species, mixiris$petalL) # sort on species name, then petalL
mixiris[oo, ]
