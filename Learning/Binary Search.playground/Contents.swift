import UIKit

let solution = Solution()
let num = solution.indexOf(13, from: [10,11,12,13,14,15])
print(num)

class Solution {
    func indexOf(_ target: Int, from numbers: [Int]) -> Int {
        var start = 0
        var end = numbers.count - 1

        while start <= end {
            let middle = (start + end) / 2
            if target < numbers[middle] {
                end = middle - 1
            } else if target > numbers[middle] {
                start = middle + 1
            } else { // target == numbers[middle]
                return middle
            }
        }
        
        return -1
    }
}
