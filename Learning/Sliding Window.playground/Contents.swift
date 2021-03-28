import UIKit

let solution = Solution()
let num = solution.maxSum(of: [80,-50,90,100], length: 2)
print(num)

class Solution {
    func maxSum(of numbers: [Int], length: Int) -> Int {
        if length > numbers.count {
            fatalError()
        }
        
        var currentSum = numbers[0 ..< length].reduce(0, +)
        var maxSum = currentSum
        
        for i in 0 ..< numbers.count - length {
            currentSum = currentSum - numbers[i] + numbers[i + length]
            maxSum = max(maxSum, currentSum)
        }
        
        return maxSum
    }
}
