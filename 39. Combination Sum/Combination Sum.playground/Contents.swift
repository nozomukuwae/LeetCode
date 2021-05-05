//Runtime: 48 ms, faster than 42.81% of Swift online submissions for Combination Sum.
//Memory Usage: 13.8 MB, less than 92.81% of Swift online submissions for Combination Sum.

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
        let minVal = candidates.min()! // time: O(N)
        var combinations = [[Int]]()
        
        // Find divisors in candidates
        for i in 0 ..< candidates.count { // time: O(N)
            if target % candidates[i] == 0 {
                combinations.append([Int](repeating: candidates[i], count: target / candidates[i]))
            }
        }
        
        let maxCount = candidates[0] == minVal ? (target - minVal - 1) / candidates[0] : (target - minVal) / candidates[0]
        var i = 0
        while i <= maxCount {
            findCombination(candidates, target - minVal, minVal, 1, &combinations, target - candidates[0] * i, [Int](repeating: candidates[0], count: i))
            i += 1
        }

        return combinations
    }
    
    func findCombination(_ candidates: [Int], _ upperLimit: Int, _ minVal: Int, _ index: Int, _ combinations: inout [[Int]], _ currentTarget: Int, _ currentCombination: [Int]) {
        
        guard currentTarget > 0 else { return }
        guard index < candidates.count else { return }
        
        let maxCount = candidates[index] == minVal ? (upperLimit - 1) / candidates[index] : upperLimit / candidates[index]
        var current = currentCombination
        var i = 0
                
        while i <= maxCount {
            if candidates[index] * i == currentTarget {
                combinations.append(current)
            } else {
                findCombination(candidates, upperLimit, minVal, index + 1, &combinations, currentTarget - candidates[index] * i, current)
            }
            
            current.append(candidates[index])
            i += 1
        }
    }
}
