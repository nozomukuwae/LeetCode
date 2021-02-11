// Runtime: 988 ms, faster than 34.12% of Swift online submissions for Best Time to Buy and Sell Stock.
// Memory Usage: 17.9 MB, less than 18.23% of Swift online submissions for Best Time to Buy and Sell Stock.


import UIKit

let solution = Solution()
let profit1 = solution.maxProfit([7,1,5,3,6,4])
print(profit1)
let profit2 = solution.maxProfit([7,6,4,3,1])
print(profit2)

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        var minPrice = Int.max
        var maxProfit = 0
        
        for p in prices {
            if p < minPrice {
                minPrice = p
            } else if p - minPrice > maxProfit {
                maxProfit = p - minPrice
            }
        }
        
        return maxProfit
    }
}
