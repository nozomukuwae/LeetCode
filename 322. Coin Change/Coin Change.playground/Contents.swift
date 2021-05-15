//Runtime: 224 ms, faster than 83.08% of Swift online submissions for Coin Change.
//Memory Usage: 14.2 MB, less than 65.38% of Swift online submissions for Coin Change.

// Time complexity: O(NM) where N = number of coins, M = amount
// Space complexity: O(NM)

import Foundation

let solution = Solution()
print(solution.coinChange([1,2,5], 11))
print(solution.coinChange([2], 3))
print(solution.coinChange([1], 0))
print(solution.coinChange([1], 1))
print(solution.coinChange([1], 2))

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        
        var numberOfCoins = [Int](repeating: Int.max, count: amount + 1)
        numberOfCoins[0] = 0
        
        for i in 1 ... amount {
            for j in 0 ..< coins.count {
                if coins[j] <= i && numberOfCoins[i - coins[j]] < Int.max {
                    numberOfCoins[i] = min(numberOfCoins[i], numberOfCoins[i - coins[j]] + 1)
                }
            }
        }
        
        return numberOfCoins[amount] < Int.max ? numberOfCoins[amount] : -1
    }
}
