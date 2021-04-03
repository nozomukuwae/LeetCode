//Runtime: 956 ms, faster than 44.00% of Swift online submissions for Boats to Save People.
//Memory Usage: 16.2 MB, less than 20.00% of Swift online submissions for Boats to Save People.

// Time complexity: O(NlogN)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.numRescueBoats([1,2], 3))
//print(solution.numRescueBoats([3,2,3,2,2], 6))
//print(solution.numRescueBoats([21,40,16,24,30], 50))

class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let peopleSorted = people.sorted()
        var i = 0
        var j = peopleSorted.count - 1
        var boatCount = 0
        
        while i < j {
            if peopleSorted[i] + peopleSorted[j] <= limit {
                i += 1
            }
            
            j -= 1
            boatCount += 1
        }
        
        if i == j {
            return boatCount + 1
        } else {
            return boatCount
        }
    }
}
