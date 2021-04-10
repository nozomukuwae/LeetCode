//Runtime: 1880 ms, faster than 19.59% of Swift online submissions for Count Primes.
//Memory Usage: 15.4 MB, less than 27.35% of Swift online submissions for Count Primes.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.countPrimes(10))
print(solution.countPrimes(0))
print(solution.countPrimes(1))
print(solution.countPrimes(4))

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n < 3 {
            return 0
        } else if n == 3 {
            return 1
        }
        
        var isPrime = Array(repeating: true, count: n)
        
        // 0, 1 are not prime numbers
        isPrime[0] = false
        isPrime[1] = false
        
        let root = Int(sqrtf(Float(n)))
        for i in 2 ... root {
            for j in stride(from: 2 * i, to: n, by: i) {
                isPrime[j] = false
            }
        }
        
        return isPrime.filter { $0 }.count
    }
}
