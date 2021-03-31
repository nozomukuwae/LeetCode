//Time Limit Exceeded

// Time complexity: O(NlogN)
// Space complexity: O(N)

import Foundation

let solution = Solution()
print(solution.numRescueBoats([1,2], 3))
//print(solution.numRescueBoats([3,2,3,2,2], 6))
//print(solution.numRescueBoats([21,40,16,24,30], 50))

class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let heavierPeople = people.filter { $0 > limit / 2 }.sorted { $0 > $1 }
        var lighterPeople = people.filter { $0 <= limit / 2 }.sorted { $0 > $1 }
        
        for i in 0 ..< heavierPeople.count {
            let spaceLeft = limit - heavierPeople[i]
            if let pairedIndex = lighterPeople.firstIndex(where: { $0 <= spaceLeft }) {
                lighterPeople.remove(at: pairedIndex)
            }
        }
        
        if lighterPeople.count % 2 == 0 {
            return heavierPeople.count + lighterPeople.count / 2
        } else {
            return heavierPeople.count + lighterPeople.count / 2 + 1
        }
    }
}
