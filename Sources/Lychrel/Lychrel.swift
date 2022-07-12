import BigInt

public struct Lychrel {
    fileprivate static func converge(_ n: BigInt, _ iteration: Int, limit: Int) -> Int {
        if !isPalindrome(n), iteration < limit {
            return converge(n + reversed(n), iteration + 1, limit: limit)
        } else {
            return iteration
        }
    }
    
    public static func convergesAtIteration(n: BigInt, limit: Int) -> Int {
        return converge(n, 0, limit: limit)
    }
    
    static func isPalindrome(_ n: BigInt) -> Bool {
        let string = String(n)
        
        for (offset, element) in string.enumerated() {
            let i = string.index(string.endIndex, offsetBy: -offset - 1)
            if element != string[i] {
                return false
            }
        }
        return true
    }
    
    static func reversed(_ n: BigInt) -> BigInt {
        BigInt(String(String(n).reversed()))!
    }
}
