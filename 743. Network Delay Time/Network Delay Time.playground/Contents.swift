//Runtime: 628 ms, faster than 25.53% of Swift online submissions for Network Delay Time.
//Memory Usage: 14.7 MB, less than 85.11% of Swift online submissions for Network Delay Time.

// Time complexity: O(N^2)
// Space complexity: O(N)

import Foundation

let solution = Solution()

print(solution.networkDelayTime([[1,2,7],[1,4,2],[2,3,6],[4,2,3],[4,5,2],[5,2,3],[5,3,6]], 5, 1))
print(solution.networkDelayTime([[2,1,1],[2,3,1],[3,4,1]], 4, 2))
print(solution.networkDelayTime([[1,2,1]], 2, 1))
print(solution.networkDelayTime([[1,2,1]], 2, 2))

class Solution {
    typealias PairFromRoot = (prevNode :Int, time: Int)
    
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {

        // Convert nested array into nested dictionary
        var mapBetweenTwo = [Int: [Int: Int]]() // [source: [dest: time]]
        for time in times { // O(N)
            if mapBetweenTwo[time[0]] == nil {
                mapBetweenTwo[time[0]] = [Int: Int]()
            }
            
            mapBetweenTwo[time[0]]![time[1]] = time[2]
        }
        
        guard mapBetweenTwo[k] != nil else { return -1 }
        
        // Fill the map (1st round)
        // If a node has a edge from k, fill with time from k
        // If not, fill with Int.max
        var mapFromRoot = [Int: PairFromRoot]()
        var unvisitedNodes = [Int: Void]()
        for i in 1 ... n { // O(N)
            if mapBetweenTwo[k]![i] != nil {
                mapFromRoot[i] = PairFromRoot(k, mapBetweenTwo[k]![i]!)
            } else {
                mapFromRoot[i] = PairFromRoot(0, Int.max)
            }
            
            unvisitedNodes[i] = ()
        }
        mapFromRoot[k] = PairFromRoot(k, 0)
        unvisitedNodes[k] = nil
        
        // Fill the map recursively until visiting all the nodes
        fillMap(&mapFromRoot, mapBetweenTwo, &unvisitedNodes) // O(N^2)

        // Calculate max time
        let maxVal = mapFromRoot.reduce(0) { (currentMax, kv) -> Int in // O(N)
            return max(currentMax, kv.value.time)
        }

        return maxVal < Int.max ? maxVal : -1
    }
    
    func fillMap(_ mapFromRoot: inout [Int: PairFromRoot], _ mapBetweenTwo: [Int: [Int: Int]], _ unvisitedNodes: inout [Int: Void]) {
        guard unvisitedNodes.count > 0 else { return }

        var minTime = Int.max
        var minKey: Int? = nil

        // Find the unvisited node which has the mininum time from k
        for node in unvisitedNodes {
            if mapFromRoot[node.key]!.time < minTime {
                minKey = node.key
                minTime = mapFromRoot[node.key]!.time
            }
        }

        guard minKey != nil else { return }

        // Fill the map (visitedNodes.count th round)
        // If a node has a edge from minKey and shorter route from k, update time from k
        if let timesFromMinKey = mapBetweenTwo[minKey!] {
            for time in timesFromMinKey { // O(N)
                if mapFromRoot[time.key]!.time > time.value + minTime {
                    mapFromRoot[time.key] = PairFromRoot(minKey!, time.value + minTime)
                }
            }
        }

        unvisitedNodes[minKey!] = nil
        fillMap(&mapFromRoot, mapBetweenTwo, &unvisitedNodes)
    }
}
