//Runtime: 32 ms, faster than 64.39% of Swift online submissions for Combination Sum.
//Memory Usage: 13.9 MB, less than 92.81% of Swift online submissions for Combination Sum.

// Time complexity: O(M^N) where N = count of candidates, M = max quotient of target / candidates
// Space complexity: O(M^N)

import Foundation

let solution = Solution()

print(solution.combinationSum([2,3,6,7], 7))
print(solution.combinationSum([2,3,5], 8))
print(solution.combinationSum([2], 1))
print(solution.combinationSum([1], 1))
print(solution.combinationSum([1], 2))

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combinations = [[Int]]()
        
        var current = [Int]()
        var p = 0
        
        while p <= target {
            if p == target {
                combinations.append(current)
            } else {
                findCombination(candidates, 1, &combinations, target - p, current)
            }
            
            current.append(candidates[0])
            p += candidates[0]
        }

        return combinations
    }
    
    func findCombination(_ candidates: [Int], _ index: Int, _ combinations: inout [[Int]], _ currentTarget: Int, _ currentCombination: [Int]) {
        
        guard currentTarget > 0 else { return }
        guard index < candidates.count else { return }
        
        var current = currentCombination
        var p = 0
                
        while p <= currentTarget {
            if p == currentTarget {
                combinations.append(current)
            } else {
                findCombination(candidates, index + 1, &combinations, currentTarget - p, current)
            }
            
            current.append(candidates[index])
            p += candidates[index]
        }
    }
}
