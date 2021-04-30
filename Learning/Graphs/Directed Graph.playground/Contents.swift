import Foundation

let al = AdjacencyList()
al.insertEdge(1, 2)
al.insertEdge(2, 3)
al.insertEdge(4, 5)
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
