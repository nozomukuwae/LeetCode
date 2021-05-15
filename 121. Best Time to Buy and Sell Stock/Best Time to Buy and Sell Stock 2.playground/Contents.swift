//Runtime: 920 ms, faster than 83.18% of Swift online submissions for Best Time to Buy and Sell Stock.
//Memory Usage: 17.7 MB, less than 50.87% of Swift online submissions for Best Time to Buy and Sell Stock.

// Time complexity: O(N)
// Space complexity: O(1)

import UIKit

let solution = Solution()
let profit1 = solution.maxProfit([7,1,5,3,6,4])
print(profit1)
let profit2 = solution.maxProfit([7,6,4,3,1])
print(profit2)

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var lowestPrice = prices[0]
        var maxProfit = max(prices[1] - lowestPrice, 0)
        lowestPrice = min(lowestPrice, prices[1])

        for i in 2 ..< prices.count {
            maxProfit = max(maxProfit, prices[i] - lowestPrice)
            lowestPrice = min(lowestPrice, prices[i])
        }
        
        return maxProfit
    }
}
