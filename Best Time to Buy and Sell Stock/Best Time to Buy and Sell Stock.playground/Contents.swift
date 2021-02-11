// Time Limit Exceeded


import UIKit

let solution = Solution()
let profit1 = solution.maxProfit([7,1,5,3,6,4])
print(profit1)
let profit2 = solution.maxProfit([7,6,4,3,1])
print(profit2)

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        
        var maxProfit = 0
        for i in 0 ..< prices.count {
            var maxPrice = prices[i]
            
            for j in i+1 ..< prices.count {
                if prices[j] > maxPrice {
                    maxPrice = prices[j]
                }
            }
            
            if maxPrice - prices[i] > maxProfit {
                maxProfit = maxPrice - prices[i]
            }
        }
        
        return maxProfit
    }
}
