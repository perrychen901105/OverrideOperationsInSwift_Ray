//: Playground - noun: a place where people can play

import UIKit

protocol Number {
    func +(l: Self, r: Self) -> Self
}

extension Double    : Number {}
extension Float     : Number {}
extension Int       : Number {}

infix operator ⊕ { associativity left precedence 140 }
func ⊕<T: Number>(left: [T], right: [T]) -> [T] {
    var minus = [T]()
    assert(left.count == right.count, "vector of same length only")
    for (key, _) in left.enumerate() {
        minus.append(left[key] + right[key])
    }
    return minus
}

var intArray = [2,4] ⊕ [1,2]