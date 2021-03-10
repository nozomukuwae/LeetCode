// Runtime: 40 ms, faster than 30.82% of Swift online submissions for Two Sum.
// Memory Usage: 14.5 MB, less than 13.51% of Swift online submissions for Two Sum.


import UIKit

let solution = Solution()
let num = solution.twoSum([3,3], 6)
print(num)

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        
        for (i, n) in numbers.enumerated() {
            if let j = dict[target - n] {
                return [j, i]
            }
            
            dict[n] = i
        }
        
        fatalError()
    }
}
