import XCTest
import BigInt
@testable import Lychrel

final class LychrelTests: XCTestCase {
    
    let limit = 1_000
    
    func testLychrel() {
        convergesAtIteration(n: 1, interation: 0)
        convergesAtIteration(n: 2, interation: 0)
        convergesAtIteration(n: 10, interation: 1)
        convergesAtIteration(n: 11, interation: 0)
        convergesAtIteration(n: 19, interation: 2)
        convergesAtIteration(n: 78, interation: 4)
        convergesAtIteration(n: 89, interation: 24)
        
        doesNotConverge(n: 196)
    }
    
    func doesNotConverge(n: BigInt, file: StaticString = #file, line: UInt = #line) {
        convergesAtIteration(n: n, interation: limit)
    }
    
    func convergesAtIteration(n: BigInt, interation: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(interation, Lychrel.convergesAtIteration(n: n, limit: limit), file: file, line: line)
    }
    
    func testPalindromes() {
        isPalindrome(1)
        isPalindrome(11)
        isPalindrome(121)
        isPalindrome(1234321)
    }
    
    func testNonPalindromes() {
        isNotPalindrome(10)
        isNotPalindrome(12331)
        isPalindrome(12344321)
    }
    
    func testIsReversed() {
        isReversed(12, reversed: 21)
        isReversed(123, reversed: 321)
        isReversed(1221, reversed: 1221)
    }
    
    func isPalindrome(_ n: BigInt, file: StaticString = #file, line: UInt = #line) {
        XCTAssertTrue(Lychrel.isPalindrome(n), file: file, line: line)
    }
    
    func isNotPalindrome(_ n: BigInt, file: StaticString = #file, line: UInt = #line) {
        XCTAssertFalse(Lychrel.isPalindrome(n), file: file, line: line)
    }
    
    func isReversed(_ n: BigInt, reversed: BigInt, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(reversed, Lychrel.reversed(n), file: file, line: line)
    }
}
