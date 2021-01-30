# Day 8

Fun stuff in R Bootcamp for Biologists at UHM.

**Approaches to COVID19 modeling class** -- LMK if you would like to be notified of guest lectures  
People working on this in Hawaii discuss their modeling approaches and demonstrate their code! Multi-disciplinary  
Generally Tuesdays at 10:30 or 11, but times move around

## Graphics!

There are so many cool demos and vignettes.
```
    require(graphics)
    require("grDevices") # for colours

    ?graphics

    demo(graphics)
    demo(image)
    demo(persp)
```
A vignette is a longer tutorial-type demonstration of a package.
Browse vignettes for a package:
```
    browseVignettes("ape")
```
Display all vignettes (only what is loaded, I believe)
```
    vignette()
```
Try this one!
```
    # install.packages("rgl", dependencies=T) if you want to install
    vignette("rgl")
```
## Evaluating symbolic math

You can use R to evaluate equations (and plot) the results! Kind of like a turbocharged graphing calculator.

Use the `eval()` Function.

For example, the [famous SIR model and its epidemic curve](https://web.stanford.edu/~jhj1/teachingdocs/Jones-Epidemics050308.pdf) (see more cool examples of this on that pdf), where:   

-   S = number of susceptible individuals and
-   I = number of infected within a population:

The `expression()` contains the equation or formula
```
    epi.curve <- expression(1/(1+ (exp(-beta*t)*(1-a0)/a0)))
    a0 <- .01
    beta <- 0.1
    t <- seq(0,100,1)
    plot(t,eval(epi.curve),type="l",col="blue",
        xlab="Time", ylab="Cumulative Fraction Infected")
```
And the plot is of time on the x-axis and the result of the epi curve on the y indicating the cummulative fraction of the population infected (as a function of time).

## Make your own animations

Illustrate the Brownian Motion model with graphics that moves :)
Check out materials in the BM simulation lab folder.

## Broken down example of scaling up with functions and loops

Check out the 5 steps in the Scaling up Example folder

## More on PCA and answering questions

See - what is a PCA? InClassExamples_Jan29.R
