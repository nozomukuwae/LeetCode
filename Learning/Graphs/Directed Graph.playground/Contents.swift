import Foundation

let al = AdjacencyList()
al.insertEdge(1, 2)
al.insertEdge(2, 3)
al.insertEdge(4, 5)
print("Adjacency List")
al.printGraph()

class AdjacencyList {
    var map = [Int: [Int]]()
    
    func insertEdge(_ v1: Int, _ v2: Int) {
        if map[v1] == nil {
            map[v1] = [Int]()
        }
        
        map[v1]?.append(v2)
    }
    
    func printGraph() {
        for key in map.keys {
            for value in map[key]! {
                print("\(key) -> \(value)")
            }
        }
    }
}

let am = AdjacencyMatrix(size: 5)
am.insertEdge(0, 1)
am.insertEdge(1, 2)
am.insertEdge(3, 4)
print("Adjacency Matrix")
am.printGraph()

class AdjacencyMatrix {
    var matrix: [[Int]]
    var size: Int
    
    init (size: Int) {
        self.size = size
        matrix = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
    }
    
    func insertEdge(_ v1: Int, _ v2: Int) {
        if (0 ..< size).contains(v1) && (0 ..< size).contains(v2) {
            matrix[v1][v2] = 1
        }
    }

    func printGraph() {
        for i in 0 ..< size {
            for j in 0 ..< size {
                if matrix[i][j] == 1 {
                    print("\(i) -> \(j)")
                }
            }
        }
    }
}
