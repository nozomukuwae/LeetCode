//Runtime: 8 ms, faster than 80.73% of Swift online submissions for Subsets.
//Memory Usage: 13.9 MB, less than 98.55% of Swift online submissions for Subsets.

// Time complexity: O(2^N)
// Space complexity: O(N*2^N)

// Output array is ignored to count space compexity.

import Foundation

let solution = Solution()

print(solution.subsets([1,2,3]))
print(solution.subsets([1,2,3]).count)
print(solution.subsets([0]))


class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ret: [[Int]] = [[nums[0]], []]
        
        if nums.count > 1 {
            createArray(nums, 1, &ret)
        }
        
        return ret
    }
    
    func createArray(_ nums: [Int], _ index: Int, _ ret: inout [[Int]]) {
        ret.append(contentsOf: ret)
        var i = 0
        while i < ret.count / 2 {
            ret[i].append(nums[index])
            i += 1
        }
        
        if index < nums.count - 1 {
            createArray(nums, index + 1, &ret)
        }
    }
}
