//Runtime: 4 ms, faster than 82.23% of Swift online submissions for Letter Combinations of a Phone Number.
//Memory Usage: 14.6 MB, less than 38.84% of Swift online submissions for Letter Combinations of a Phone Number.

// Time complexity: O(N * 4^N)
// Space complexity: O(N)

// Output array is ignored to count space compexity.

import Foundation

let solution = Solution()

print(solution.letterCombinations("23"))
print(solution.letterCombinations(""))
print(solution.letterCombinations("2"))

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        
        let digitsArray = Array(digits)
        var combinations = digitToCandidates(digitsArray[0])
        createCombinations(digitsArray, 1, &combinations)

        return combinations
    }
    
    func createCombinations(_ digits: [Character], _ index: Int, _ combinations: inout [String]) {
        guard index < digits.count else { return }
        
        let candidates = digitToCandidates(digits[index])
        copyElements(&combinations, candidates.count)
        
        for i in 0 ..< combinations.count {
            combinations[i].append(candidates[i % candidates.count])
        }
        
        createCombinations(digits, index + 1, &combinations)
    }
    
    func copyElements(_ array: inout [String], _ count: Int) {
        if count <= 1 { return }
        
        var i = 0
        let countAfterCopy = array.count * count
        
        while i < countAfterCopy {
            for _ in 1 ..< count {
                array.insert(array[i], at: i)
            }
            i += count
        }
    }
        
    func digitToCandidates(_ digit: Character) -> [String] {
        switch digit {
        case "2":
            return ["a","b","c"]
        case "3":
            return ["d","e","f"]
        case "4":
            return ["g","h","i"]
        case "5":
            return ["j","k","l"]
        case "6":
            return ["m","n","o"]
        case "7":
            return ["p","q","r","s"]
        case "8":
            return ["t","u","v"]
        case "9":
            return ["w","x","y","z"]
        default:
            fatalError()
        }
    }
}
