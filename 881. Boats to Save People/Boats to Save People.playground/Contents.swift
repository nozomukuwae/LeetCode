//Runtime: 1012 ms, faster than 24.00% of Swift online submissions for Boats to Save People.
//Memory Usage: 15.8 MB, less than 92.00% of Swift online submissions for Boats to Save People.

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
        
        while i < j {
            if peopleSorted[i] + peopleSorted[j] <= limit {
                i += 1
            }
            
            j -= 1
        }
        
        if i == j {
            return peopleSorted.count - j
        } else {
            return peopleSorted.count - j - 1
        }
    }
}
