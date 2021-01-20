mysqrt <- function( x=64, tol=.00001, myguess=10){

	newguess <- myguess
	error <- tol + 1

	while ( error > tol ) { 
	  approxy <- x/newguess
	  newguess <- (newguess+approxy)/2 
	  error = newguess - approxy
	  print(error < tol) 
	  print(newguess)
	  print(error)
	}
	return( newguess )

}