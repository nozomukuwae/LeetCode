import Foundation

class Graph {
    var graph = [Int: [Int]]()
    
    func insertEdge(v1: Int, v2: Int) {
        if self.graph[v1] == nil {
            self.graph[v1] = [Int]()
        }
        
        self.graph[v1]!.append(v2)
    }
    
    func bfs(startNode: Int) {
        var visited = Set<Int>()
        var queue = [Int]()
        queue.insert(startNode, at: 0)
        visited.insert(startNode)
        print("insert & visit \(startNode)")

        while let current = queue.popLast() {
            if let children = self.graph[current] {
                for vertex in children {
                    if !visited.contains(vertex) {
                        queue.insert(vertex, at: 0)
                        visited.insert(vertex)
                        print("insert & visit \(vertex)")
                    }
                }
            }
        }
    }
}

let g = Graph()
g.insertEdge(v1: 2, v2: 1)
g.insertEdge(v1: 2, v2: 5)
g.insertEdge(v1: 5, v2: 6)
g.insertEdge(v1: 5, v2: 8)
g.insertEdge(v1: 6, v2: 9)

g.bfs(startNode: 2)
