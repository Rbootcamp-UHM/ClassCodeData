## Drop Tip example
require(ape)

# Adapted from the help page - 
?drop.tip

data(bird.families) 
bird.families 		# a phylogeny
plot(bird.families) 	# a big phylogeny!

todrop <- c(
"Eopsaltriidae", "Acanthisittidae", "Pittidae", "Eurylaimidae",
"Philepittidae", "Tyrannidae", "Thamnophilidae", "Furnariidae",
"Formicariidae", "Conopophagidae", "Rhinocryptidae", "Climacteridae",
"Menuridae", "Ptilonorhynchidae", "Maluridae", "Meliphagidae",
"Pardalotidae", "Petroicidae", "Irenidae", "Orthonychidae",
"Pomatostomidae", "Laniidae", "Vireonidae", "Corvidae",
"Callaeatidae", "Picathartidae", "Bombycillidae", "Cinclidae",
"Muscicapidae", "Sturnidae", "Sittidae", "Certhiidae",
"Paridae", "Aegithalidae", "Hirundinidae", "Regulidae",
"Pycnonotidae", "Hypocoliidae", "Cisticolidae", "Zosteropidae",
"Sylviidae", "Alaudidae", "Nectariniidae", "Melanocharitidae",
"Paramythiidae","Passeridae", "Fringillidae")   # a character vector

smaller.tree <- drop.tip(bird.families, todrop)
plot(smaller.tree)

# letʻs drop more
# tips are located 
tips <- bird.families$tip.label
length(tips)

## suppose you only want a few families
tokeep <- c("Passeridae", "Falconidae", "Corvidae", "Struthionidae", "Tinamidae")

## We want to get the todrop list:
tips %in% tokeep   # indexes tips telling us where the tokeep species are
! tips %in% tokeep	# The opposite - index vector pointing to which tips to drop
				
todrop <- tips[ !(tips %in% tokeep) ]  # use to index tips

tree <- drop.tip(bird.families, todrop)

plot(tree)
plot (drop.tip(bird.families, todrop, trim.internal=F))

## The todrop vector is just a vector, you can index it as any normal R object
