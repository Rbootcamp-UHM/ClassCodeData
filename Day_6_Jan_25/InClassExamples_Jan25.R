islands <- c("oahu", "kauai", "maui")
for (i in islands) {
	print(i)
	 }
	 
for (i in 1:3) { 
	print(paste("This is a for loop", i))
}	 

par(mfrow=c(3,1))
for (i in 1:3) { 
  x <- rnorm(100)
  y <- rnorm(100)
  plot(x,y)
}	 

pdf()      # opens a pdf device
for (i in 1:3) { # runs code 3 times: i=1, i=2, i=3
    x <- rnorm(100)
    y <- rnorm(100)
    plot(x,y, main = paste("this is plot", i))  # plot executed once for each iteration through the loop
}	 
dev.off()  # close the pdf device


# an example for how to use your paint.iris() in a loop 

# paint.iris( ... my original data) ## first define the function properly :)

pdf()      # opens a pdf device
for (i in 1:3) { 
    x <- rnorm(100)
    y <- rnorm(100)
    paint.iris(x,y, main = paste("this is plot", i))  # Then use the function here - on simulations
}	 
dev.off()  # close the pdf device

mylist <- vector("list")   ## creates a null (empty) list
for (i in 1:4) {
   mylist <- c(mylist, list(data.frame(x=rnorm(3), y=rnorm(3))))
}
mylist

############################################
#### Examples of using lists in for loop

## Example generating pdf plots in for loop 
## print()  is a great debugging tool! if you want to check values interal
## to a loop or function

pdf(file="mickey.pdf")      # opens a pdf device, saves to mickey.pdf
for (i in 1:4) {    # will run 4 times, i=1, i=2, i=3, i=4
	print(i)
    plot(mylist[[i]], main = paste("this is plot", i))
}	 
dev.off()  # close the pdf device


## Above example runs counter i over 1:4, below is same but uses
## length(mylist) to get end of sequence so code is more reusable

pdf(file="mickey2.pdf")      
for (i in 1:length(mylist)) {   # same as mylist is length=4
	print(i)
    plot(mylist[[i]], main = paste("this is plot", i))
}	 
dev.off()  # close the pdf device

## iterates list over the list elements itself instead of 1:4

pdf(file="mickey3.pdf")      
for (i in mylist) { # iterates over elements of mylist iteself
	print(i)
    plot(i, main = paste("this is plot", i))
}	 
dev.off()  # close the pdf device

