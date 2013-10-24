## Load library
library(igraph)
source("myFunctions.R")

###############################################
## Generate Erdos-Renyi model
###############################################
## Create a random network (ER) with 100 nodes and with p=0.02
er <- erdos.renyi.game(n=1000, p.or.m=4/1000)
plot(er, layout=layout.fruchterman.reingold, vertex.size=3, vertex.label=NA)

## Plot the degree distribution
er.d <- degree(er)
er.dd <- degree.distribution(er)    ## In R < 3.0.0
er.dd <- my.degree.distribution(er)    ## In R 3.0.0
plot(er.dd, xlab="degree", ylab="frequency", pch=19, col=1, type="b", main="Degree distribution")
hist(degree(er))

## Plot the clustering coefficient
er.cc <- transitivity(er, type="local")
er.degree <- degree(er)
plot(er.degree, er.cc, xlab="degree", ylab="clustering coefficient", pch=19, col=1, main="Clustering coefficient")
###############################################

###############################################
## Generate Watts-Strogatz model
###############################################
ws <- watts.strogatz.game(dim=1, size=10, nei=2, p=0)
plot(ws, layout=layout.fruchterman.reingold, vertex.size=3, vertex.label=NA)

ws <- watts.strogatz.game(dim=1, size=1000, nei=4, p=0.05)
plot(ws, layout=layout.fruchterman.reingold, vertex.size=3, vertex.label=NA)

## Plot the degree distribution


## Plot the clustering coefficient

###############################################

###############################################
## Generate Barabási-Albert model
###############################################
ba <- barabasi.game(n=1000, power=1.5, m=3)
plot(ba, layout=layout.fruchterman.reingold, vertex.size=3, vertex.label=NA)

## Plot the degree distribution


## Plot the clustering coefficient

###############################################


## non-linear preferential attachment
######################################
g1 <- barabasi.game(10000, power=0.5)
g2 <- barabasi.game(10000, power=1)
g3 <- barabasi.game(10000, power=1.5)

## For R < 3.0.0
plot(degree.distribution(g3), xlab="degree", ylab="frequency", log="xy", pch=3, col=3, type="b")
points(degree.distribution(g2), pch=2, col=2, type="b")
points(degree.distribution(g1), pch=1, col=1, type="b")
legend(max(degree(g3)), 1, xjust=1, yjust=1, c(0.5,1,1.5), pch=1:3, col=1:3, lty=1)

## For R 3.0.0
plot(my.degree.distribution(g3), xlab="degree", ylab="frequency", log="xy", pch=3, col=3, type="b")
points(my.degree.distribution(g2), pch=2, col=2, type="b")
points(my.degree.distribution(g1), pch=1, col=1, type="b")
legend(max(degree(g3)), 1, xjust=1, yjust=1, c(0.5,1,1.5), pch=1:3, col=1:3, lty=1)

