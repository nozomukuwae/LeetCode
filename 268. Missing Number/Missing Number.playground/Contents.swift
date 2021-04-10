//Runtime: 200 ms, faster than 14.92% of Swift online submissions for Missing Number.
//Memory Usage: 14.5 MB, less than 31.90% of Swift online submissions for Missing Number.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.missingNumber([3,0,1])) // 2
print(solution.missingNumber([0,1])) // 2
print(solution.missingNumber([9,6,4,2,3,5,7,0,1])) // 8
print(solution.missingNumber([0])) // 1

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var dictionary = [Int: Int]()
        nums.indices.map { dictionary[nums[$0]] = $0 }
        
        return (0 ... nums.count).first(where: { dictionary[$0] == nil })!
    }
}
