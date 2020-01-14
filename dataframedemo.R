iris			# A built-in dataframe
head(iris)	# just first 6 rows
dim(iris)	# dimensions
length(iris)  # only for 1-dimensional objects

## Dataframe access by row,column number and by name

iris[1,2]	# accessing value 1,2
iris[1:3, 1]	# pay attention to which methods return vectors
iris[3, 4:1]	# and which return dataframes, and why
iris[1, "Species"]

iris["Species"]
head(iris["Species"])
head(iris[4:5])

iris$Species

class(iris["Species"])
class(iris$Species)
dim(iris["Species"])
dim(iris$Species)
length(iris$Species)

iris[[5]]   # list accessor
class(iris[[5]]) # what is this?

length(iris)
