//Runtime: 32 ms, faster than 98.13% of Swift online submissions for Two Sum.
//Memory Usage: 14 MB, less than 65.95% of Swift online submissions for Two Sum.

// Time complexity: O(N)
// Space complexity: O(N)

import UIKit

let solution = Solution()
print(solution.twoSum([2,7,11,15], 9))
print(solution.twoSum([3,2,4], 6))
print(solution.twoSum([3,3], 6))

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for i in 0 ..< numbers.count {
            if let j = dict[target - numbers[i]] {
                return [j, i]
            }
            
            dict[numbers[i]] = i
        }
        
        return [0, 0]
    }
}
