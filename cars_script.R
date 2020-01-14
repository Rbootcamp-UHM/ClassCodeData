# cars <- read.csv( "cars.csv")
cars     # built in dataset - comes with R

speed <-  cars$speed  # save speed as a vector
dist <-  cars$dist

plot( speed, dist, cex=2)  # plot x,y
speed.lm <- lm (dist ~ speed)   # save regression line

abline( speed.lm, col="red" )   # plot regression line

write.csv(cars, "cars.csv")  # save data to csv file in working directory