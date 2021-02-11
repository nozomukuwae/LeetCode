// Runtime: 944 ms, faster than 44.22% of Swift online submissions for Best Time to Buy and Sell Stock.
// Memory Usage: 17.4 MB, less than 50.90% of Swift online submissions for Best Time to Buy and Sell Stock.


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
            minPrice = min(minPrice, prices[i])
            maxProfit = max(maxProfit, prices[i] - minPrice)
        }
        
        return maxProfit
    }
}
