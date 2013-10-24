__author__ = 'mbleda'

from igraph import *

## Create a graph
g = Graph(20)
edges = ((1, 5), (1,2), (2, 3), (2, 4), (3, 4), (3,19), (3,0), (4, 5), (5, 6), (5,9))
g = g.add_edges(edges)
edges = ((6,7), (6,8), (7,8), (8,9), (8, 18), (9, 10), (10, 11), (11, 12), (11, 13), (11,17))
g = g.add_edges(edges)
edges = ((12, 13), (13, 14), (13, 15), (14,15), (15, 16), (16, 17), (16, 0), (17, 18), (18, 19))
g = g.add_edges(edges)
edges = ((19, 0))
g = g.add_edges(edges)

print(summary(g))
print (g.degree([1,2,3,4,5,6,7]))

## Plot if needed
plot(g, "plot.pdf", layout = g.layout("kk"))

## Generate the shortest path length through Dijkstra algorithm.
g.vs["dij"] = g.shortest_paths_dijkstra(g.vs)


## Erdos Renyi
g = Graph.Erdos_Renyi(n=300, m=250)
colors = ["lightgray", "cyan", "magenta", "yellow", "blue", "green", "red"]
for component in g.components():
  color = colors[min(6, len(component)-1)]
  for vidx in component: g.vs[vidx]["color"] = color

plot(g, layout="fr", vertex_label=None)


## MST
def distance(p1, p2):
    return ((p1[0]-p2[0]) ** 2 + (p1[1]-p2[1]) ** 2) ** 0.5

g, xs, ys = Graph.GRG(100, 0.2, return_coordinates=True)
layout = Layout(zip(xs, ys))

weights = [distance(layout[edge.source], layout[edge.target]) for edge in g.es]
max_weight = max(weights)
g.es["width"] = [6 - 5*weight/max_weight for weight in weights]
mst = g.spanning_tree(weights)

fig = Plot()
fig.add(g, layout=layout, opacity=0.25, vertex_label=None)
fig.add(mst, layout=layout, edge_color="red", vertex_label=None)
fig.show()