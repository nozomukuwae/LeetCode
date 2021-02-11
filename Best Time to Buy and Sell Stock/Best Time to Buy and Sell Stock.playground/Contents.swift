// Runtime: 940 ms, faster than 45.13% of Swift online submissions for Best Time to Buy and Sell Stock.
// Memory Usage: 17.8 MB, less than 27.08% of Swift online submissions for Best Time to Buy and Sell Stock.


import UIKit

let solution = Solution()
let profit1 = solution.maxProfit([7,1,5,3,6,4])
print(profit1)
let profit2 = solution.maxProfit([7,6,4,3,1])
print(profit2)

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        var minPrice = prices[0]
        var maxProfit = 0
        
        for i in 1 ..< prices.count {
            if prices[i] < minPrice {
                minPrice = prices[i]
            } else if prices[i] - minPrice > maxProfit {
                maxProfit = prices[i] - minPrice
            }
        }
        
        return maxProfit
    }
}
