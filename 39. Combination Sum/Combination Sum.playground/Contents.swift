//Runtime: 32 ms, faster than 64.39% of Swift online submissions for Combination Sum.
//Memory Usage: 14 MB, less than 75.18% of Swift online submissions for Combination Sum.

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
        
        let maxCount = target / candidates[0]
        var i = 0
        while i <= maxCount {
            if candidates[0] * i == target {
                combinations.append([Int](repeating: candidates[0], count: i))
            } else {
                findCombination(candidates, 1, &combinations, target - candidates[0] * i, [Int](repeating: candidates[0], count: i))
            }
            
            i += 1
        }

        return combinations
    }
    
    func findCombination(_ candidates: [Int], _ index: Int, _ combinations: inout [[Int]], _ currentTarget: Int, _ currentCombination: [Int]) {
        
        guard currentTarget > 0 else { return }
        guard index < candidates.count else { return }
        
        let maxCount = currentTarget / candidates[index]
        var current = currentCombination
        var i = 0
                
        while i <= maxCount {
            if candidates[index] * i == currentTarget {
                combinations.append(current)
            } else {
                findCombination(candidates, index + 1, &combinations, currentTarget - candidates[index] * i, current)
            }
            
            current.append(candidates[index])
            i += 1
        }
    }
}
