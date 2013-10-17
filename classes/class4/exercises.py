__author__ = 'aleman'

import sys
import random
from igraph import *
from priodict import priorityDictionary



#### Methods

def bfs(graph, start):
    """Breadth first search from start"""
    path = []

    # ...

    return path


def dfs(graph, start):
    """Depth first search from start"""
    path=[]

    # ...

    return path


def is_there_any_path(graph, start, end):

    # ...

    return False


def Dijkstra(graph,start,end=None):
	distances = {}	# dictionary of final distances
	predec = {}	# dictionary of predecessors
	queue = priorityDictionary()   # est.dist. of non-final vert.
	queue[start] = 0
	# ...
    return (distances, predec)

def shortestPath(G,start,end):

    distances, predec = Dijkstra(G,start,end)
    path = []
    while 1:
        path.append(end)
        if end == start: break
        end = predec[end]
    path.reverse()
    return path


def remove_random_node(graph):
    index = random.randrange(0, graph.vcount())
    graph.delete_vertices(index)

def generate_graph(num_nodes=100):
    g = Graph.Erdos_Renyi(n=num_nodes, p=0.1, directed=True)
    weights = [random.randrange(0, g.ecount()) for _ in range(0, g.ecount())]
    g.es["weight"] = weights
    return g





    #### TEST CODE

# Generate a random Graph
g = generate_graph(100)



# Test the BFS algorithm

g_bfs = bfs(g, 1)

print "BFS"
print(g_bfs)


# Test the BFS algorithm

g_dfs = dfs(g, 1)

print "DFS"
print(g_dfs)


# is_there_a_path

if(is_there_any_path(g, 1, 9)):
    print "There is a path between node(1) and node(9)"
else:
    print "There is not a path between node(1) and node(9)"

#   remove random node

print "Remove random node"
remove_random_node(g)

if(is_there_any_path(g, 1, 9)):
    print "After removing the vertex, there is a path between node(1) and node(9)"
else:
    print "After removing the vertex, there is not a path between node(1) and node(9)"



# Shortest path

path = shortestPath(g,1, 9)

print "the shortest path between 1 - 9 is: "
print path
