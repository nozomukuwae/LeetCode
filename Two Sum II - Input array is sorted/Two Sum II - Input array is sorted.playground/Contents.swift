// Runtime: 28 ms, faster than 94.07% of Swift online submissions for Two Sum.
// Memory Usage: 14.6 MB, less than 30.43% of Swift online submissions for Two Sum.


import UIKit

let solution = Solution()
let output = solution.twoSum([2,7,11,15], 9)
print(output)

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var i = 0
        var j = numbers.count - 1
        
        while i < j {
            let sum = numbers[i] + numbers[j]
            if sum < target {
                i += 1
            } else if sum > target {
                j -= 1
            } else {
                return [i + 1, j + 1]
            }
        }
        
        fatalError()
    }
}
