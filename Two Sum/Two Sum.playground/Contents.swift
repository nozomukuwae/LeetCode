// Runtime: 36 ms, faster than 73.06% of Swift online submissions for Two Sum.
// Memory Usage: 14.5 MB, less than 13.51% of Swift online submissions for Two Sum.


import UIKit

let solution = Solution()
let num = solution.twoSum([3,3], 6)
print(num)

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        
        for i in (0 ..< numbers.count) {
            if let j = dict[target - numbers[i]] {
                return [j, i]
            }
            
            dict[numbers[i]] = i
        }
        
        fatalError()
    }
}
