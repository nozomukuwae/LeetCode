import UIKit

let s = "MCMXCIII"
let solution = Solution()
let num = solution.romanToInt(s)

print(num)


class Solution {
    func romanToInt(_ s: String) -> Int {
        var chars = Array(s)
        var num = 0
        
        loop:
        while chars.count > 0 {
            switch chars[0] {
            case "I":
                if (chars.count > 1) {
                    switch chars[1] {
                    case "X":
                        num += 9
                    case "V":
                        num += 4
                    default: // Only "I" comes here and after
                        num += 2
                    }
                    
                    chars.removeFirst(2)
                } else {
                    return num + 1
                }
            case "V":
                num += 5
                chars.removeFirst()
            case "X":
                if (chars.count > 1) {
                    switch chars[1] {
                    case "C":
                        num += 90
                    case "L":
                        num += 40
                    case "X":
                        num += 20
                    case "V":
                        num += 15
                    default: // I
                        num += 10
                        chars.removeFirst()
                        continue loop // Re-evaluate "I" again in next cycle, in case that "X""V" comes after "I"
                    }
                    
                    chars.removeFirst(2)
                } else {
                    return num + 10
                }
            case "L":
                num += 50
                chars.removeFirst()
            case "C":
                if (chars.count > 1) {
                    switch chars[1] {
                    case "M":
                        num += 900
                    case "D":
                        num += 400
                    case "C":
                        num += 200
                    case "L":
                        num += 150
                    case "V":
                        num += 105
                    default: // X, I
                        num += 100
                        chars.removeFirst()
                        continue loop // Re-evaluate again in next cycle
                    }
                    
                    chars.removeFirst(2)
                } else {
                    return num + 100
                }
            case "D":
                num += 500
                chars.removeFirst()
            case "M":
                num += 1000
                chars.removeFirst()
            default:
                fatalError()
            }
        }
        
        return num
    }
}
