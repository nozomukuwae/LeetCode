import UIKit

let solution = Solution()
let num = solution.indexOf(13, from: [10,11,12,13,14,15])
print(num)

class Solution {
    func indexOf(_ target: Int, from numbers: [Int]) -> Int {
        return binarySearch(target, from: numbers, start: 0, end: numbers.count - 1)
    }
    
    private func binarySearch(_ target: Int, from numbers: [Int], start: Int, end: Int) -> Int {
        if start >= end {
            return target == numbers[start] ? start : -1
        }
        
        let middle = (start + end) / 2
        if target < numbers[middle] {
            return binarySearch(target, from: numbers, start: start, end: middle - 1)
        } else if target > numbers[middle] {
            return binarySearch(target, from: numbers, start: middle + 1, end: end)
        } else { // target == numbers[middle]
            return middle
        }
    }
}
