//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

infix operator ⊕ {associativity left precedence 140}

func ⊕(left: [Int], right: [Int]) -> [Int] {
    var sum = [Int]()
    assert(left.count == right.count, "vector of smae length only")
    for (key, _) in left.enumerate() {
        sum.append(left[key] + right[key])
    }
    return sum
}

infix operator  ⊕= { associativity left precedence 140 } // 1
func ⊕=(inout left: [Int], right: [Int]) { // 2
    left = left ⊕ right
}

var sumArray = [1, 2, 3] ⊕ [1, 2, 3]

infix operator ⊖ {associativity left precedence 140}
func ⊖(left: [Int], right: [Int]) -> [Int] {
    var sum = [Int]()
    assert(left.count == right.count, "vector of smae length only")
    for (key, _) in left.enumerate() {
        sum.append(left[key] - right[key])
    }
    return sum
}

var subArray = [1, 2, 3] ⊖ [1, 2, 3]

