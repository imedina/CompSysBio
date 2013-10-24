## Installation (do not rut if you have already install it)
#install.packages("igraph")

## Load library
library(igraph)

###############################################
## Creating a graph
###############################################
## 5 vertices, 4 edges, by default is directed
g <- graph( edges=c(1,2, 1,3, 2,3, 3,5), n=5 )
plot(g)

## If we want it undirected
g <- graph(edges=c(1,2, 1,3, 2,3, 3,5), n=5, directed=F)
plot(g)

## Other functions to create graphs
plot(graph.empty(n=10))
plot(graph.full(10, directed=F))
plot(graph.star(10, mode="undirected"))         ## modes: "in", "out", "undirected"
plot(graph.tree(15))
plot(graph.ring(15, directed=T))
plot(graph.lattice(c(5,5)))

adj.mat <- matrix(sample(0:1, 100, replace=TRUE, prob=c(0.9,0.1)), nc=10)
plot(graph.adjacency(adj.mat))

## Adding and removing vertices and edges
plot(g)
g <- add.vertices(graph=g, nv=2)
plot(g)
g <- add.edges(graph=g, edges=c(3,4, 6,2, 7,7))
plot(g)

g <- delete.edges(graph=g, edges=7)
plot(g)
g <- delete.vertices(graph=g, v=7)
plot(g)
###############################################


###############################################
## Accessing graph information
###############################################
vcount(g)                                               ## Number of vertices
V(g)                                                    ## List of vertices
V(g)$name <- LETTERS[1:6]                               ## Create a node attribute with the name of the nodes
V(g)$color <- c(rep("steelblue2",3), rep("tomato",3))   ## Create a node attribute with the colors of the nodes
plot(g)
V(g)[1]$name                                            ## Access first node name
V(g)[3]$color                                           ## Access third node color
list.vertex.attributes(g)                               ## List vertex attributes

ecount(g)                                               ## Number of edges
E(g)                                                    ## List of edges
E(g)[2]                                                 ## Access second edge
#E(g)$weight <- c(0.2, 0.5, 0.1, 0.7, 0.9, 0.4)         ## Weight attribute (be careful!)
E(g)$width <- c(2, 5, 1, 7, 9, 4)                       ## Create an edge attribute with the width of the edge
list.edge.attributes(g)                                 ## List edge attributes

is.directed(g)

plot(g)
tkplot(g)
###############################################


###############################################
## Accessing topological information but...
## with a real world example
###############################################

## Read graph
ex1 <- read.graph(file="examples/example1.txt", format="edgelist", directed=F)
V(ex1)$name <- LETTERS[1:vcount(ex1)]
plot(ex1)

## Local topological parameters
##-----------------------------
degree(ex1)                        ## Node degree: number of direct interactors
betweenness(ex1)                   ## Betweenness: number of shortest paths going through this node
closeness(ex1)                     ## Closeness: average distance to all other nodes
transitivity(ex1, type="local")    ## Clustering Coefficient: degree to which nodes in a graph tend to cluster together

## Global topological parameters
##-----------------------------
degree.distribution(graph=ex1)
dd <- degree.distribution(graph=ex1)        ## Degree distribution (not working in R 3.0.0)
## if this command returns "NULL" try this:
source("myFunctions.R")
dd <- my.degree.distribution(ex1)
plot(dd, xlab="Degree", ylab="Frequency", type="b", pch=20)

transitivity(ex1)                  ## Clustering coefficient: ratio of the triangles and the connected triples in the graph
diameter(ex1)                      ## Diameter length
get.diameter(ex1)                  ## Diameter nodes
shortest.paths(graph=ex1)          ## Shortest path: length of all the shortest paths from or to the vertices in the network
shortest.paths(graph=ex1, v=1)     ## Shortest path length from node 1
get.shortest.paths(ex1, from=1)    ## Get the nodes in the shortest path 
average.path.length(ex1)           ## Average path length
## IMPORTANT:
## If an attribute V(g)$weight is created, they will be considered in the calculation


## a nice way of plotting the diameter it
##----------------------------------------
d <- get.diameter(ex1)
E(ex1)$color <- "grey"
E(ex1)$width <- 1
E(ex1, path=d)$color <- "red"
E(ex1, path=d)$width <- 2
V(ex1)$label.color <- "blue"
V(ex1)$color  <- "SkyBlue2"
V(ex1)[ d ]$label.color <- "black"
V(ex1)[ d ]$color <- "red"
plot(ex1, layout=layout.fruchterman.reingold, vertex.label.dist=0, vertex.size=15)
###############################################

## More nice examples here: http://igraph.sourceforge.net/screenshots2.html

###############################################
## Example 2: Try yourself!
###############################################

###############################################