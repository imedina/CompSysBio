###############################################
## Corrected degree distribution function (R 3.0)
###############################################
my.degree.distribution <- function(graph, cumulative = FALSE, ...){
  if (!is.igraph(graph)) {
    stop("Not a graph object")
  }
  cs <- degree(graph, ...)
  hi <- hist(cs, -1:max(cs), plot = FALSE)$density
  if (!cumulative) {
    res <- hi
  }
  else {
    res <- rev(cumsum(rev(hi)))
  }
  res
}

my.count.degree.distribution <- function(graph, cumulative = FALSE, ...){
  if (!is.igraph(graph)) {
    stop("Not a graph object")
  }
  cs <- degree(graph, ...)
  hi <- hist(cs, -1:max(cs), plot = FALSE)$count
  if (!cumulative) {
    res <- hi
  }
  else {
    res <- rev(cumsum(rev(hi)))
  }
  res
}
