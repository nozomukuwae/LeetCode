//Runtime: 328 ms, faster than 53.88% of Swift online submissions for Count Primes.
//Memory Usage: 15.4 MB, less than 27.35% of Swift online submissions for Count Primes.

// Time complexity: O(N)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.countPrimes(10))
print(solution.countPrimes(0))
print(solution.countPrimes(1))
print(solution.countPrimes(3))

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n < 3 {
            return 0
        }
        
        var isPrime = Array(repeating: true, count: n)
        
        // 0, 1 are not prime numbers
        isPrime[0] = false
        isPrime[1] = false
        
        var i = 2
        var j: Int!
        while i * i < n {
            if isPrime[i] {
                
                j = 2 * i
                while j < n {
                    isPrime[j] = false
                    j += i
                }
            }
            
            i += 1
        }
        
        return isPrime.filter { $0 }.count
    }
}
