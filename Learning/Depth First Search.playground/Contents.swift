import Foundation

class Graph {
    var graph = [Int: [Int]]()
    
    func insertEdge(v1: Int, v2: Int) {
        if self.graph[v1] == nil {
            self.graph[v1] = [Int]()
        }
        
        self.graph[v1]!.append(v2)
    }
    
    func dfs(startNode: Int) {
        var visited = Set<Int>()
        var stack = [Int]()
        stack.append(startNode)
        print("append \(startNode)")

        while let current = stack.popLast() {
            if !visited.contains(current) {
                print("visit \(current)")
                visited.insert(current)
            }
            
            if let children = self.graph[current] {
                for vertex in children {
                    if !visited.contains(vertex) {
                        stack.append(vertex)
                        print("append \(vertex)")
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

g.dfs(startNode: 2)
