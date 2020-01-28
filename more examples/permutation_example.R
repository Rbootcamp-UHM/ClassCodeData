ht <- c( 64, 72, 72, 70, 60, 71, 71, 69, 69, 71, 71)
sex <- c( 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0)

fht <- ht[ sex==0]
mht <- ht[ sex==1]
success <- 0

obsdiff <- mean(mht) - mean(fht)

hist(ht)
abline( v=mean(mht), col="red")
abline( v=mean(fht), col="blue")

index <- 1: length(ht)

fi <- sample(index, length(fht))
fsample <- ht[ fi]
msample <- ht[-fi]

simdiff <- mean(msample) - mean(fsample)

success <- success + (obsdiff < simdiff)

mysample <- function( ht, samplesize) {
  fi <- sample(1:length(ht), samplesize)
  fsample <- ht[ fi]
  msample <- ht[-fi]
 
  return( mean(msample) - mean(fsample) ) 
}

success=0
nsim = 1000

for (i in 1:nsim) {
	simdiff <- mysample(ht, length(fht))
	success <- success + (obsdiff < simdiff)
	print( paste(i, obsdiff, simdiff, success, sep="  ") )
}

pval <- success / nsim