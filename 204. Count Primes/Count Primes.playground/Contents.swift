//Runtime: 816 ms, faster than 35.92% of Swift online submissions for Count Primes.
//Memory Usage: 15.5 MB, less than 24.49% of Swift online submissions for Count Primes.

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
        }
        
        var isPrime = Array(repeating: true, count: n)
        
        // 0, 1 are not prime numbers
        isPrime[0] = false
        isPrime[1] = false
        
        let root = Int(sqrtf(Float(n)))
        var i = 2
        while i <= root {
            if isPrime[i] {
                for j in stride(from: 2 * i, to: n, by: i) {
                    isPrime[j] = false
                }
            }
            
            i += 1
        }
        
        return isPrime.filter { $0 }.count
    }
}
