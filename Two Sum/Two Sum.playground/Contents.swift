// Runtime: 36 ms, faster than 73.06% of Swift online submissions for Two Sum.
// Memory Usage: 14 MB, less than 76.34% of Swift online submissions for Two Sum.


import UIKit

let solution = Solution()
let num = solution.twoSum([3,2,4], 6)
print(num)

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        for i in (0 ..< numbers.count) {
            let wantedValue = target - numbers[i]
            
            for j in (i + 1 ..< numbers.count) {
                if numbers[j] == wantedValue {
                    return [i, j]
                }
            }
        }
        
        fatalError()
    }
}
