//: Playground - noun: a place where people can play

import UIKit

//Type Parameters

func swapTwoValues<T>(inout a: T, inout _ b: T) {
    
    let temporaryA = a
    
    a = b
    
    b = temporaryA
}

var someInt = "Good luck"

var anotherInt = "Good night"

swapTwoValues(&someInt, &anotherInt)

swap(&anotherInt, &someInt)

print("someInt: \(someInt) and anotherInt: \(anotherInt)")

// Generic Types

protocol Container {
    
    typealias ItemType
    
    mutating func append(item: ItemType)
    
    var count: Int { get }
    
    subscript(i: Int) -> ItemType { get }
}

struct Stack<Element>: Container {
    
    var items = [Element]()
    
    mutating func push(item: Element) {
        
        items.append(item)
    }
    
    mutating func pop() -> Element {
        
        return items.removeLast()
    }
    
    // conformance to the Container protocol
    
    mutating func append(item: Element) {
        
        self.push(item)
    }
    
    var count: Int {
        
        return items.count
    }
    
    subscript(i: Int) -> Element {
        
        return items[i]
    }
}

var stackOfDouble = Stack<Double>()

stackOfDouble.push(1.0)

stackOfDouble.push(2.0)

stackOfDouble.push(3.0)

// Extending a Generic Type

extension Stack {
    
    var topItem: Element? {
        
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfDouble.topItem {
    
    print("The top item on the stack is \(topItem)")
}

// Type Constraints

func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    
    for (index, value) in array.enumerate() {
        
        if value == valueToFind {
            
            return index
        }
    }
    
    return nil
}

let stringsArray = ["cat", "dog", "pig", "pangu", "lion", "tiger"]

if let foundIndex = findIndex(stringsArray, "tiger") {
    
    print("The index found: \(foundIndex)")
}

// Associated Types

func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>(someContainer: C1, _ anotherContainer: C2) -> Bool {
    
    if someContainer.count != anotherContainer.count {
        
        return false
    }
    
    for i in 0..<someContainer.count {
        
        if someContainer[i] != anotherContainer[i] {
            
            return false
        }
    }
    
    return true
}

var stackOfStrings = Stack<String>()

stackOfStrings.push("1")

stackOfStrings.push("2")

stackOfStrings.push("3")

var arrayOfStrings = ["1", "2", "3"]


if allItemsMatch(stackOfStrings, arrayOfStrings) {
    
    print("All items matched.")

} else {
    
    print("Not all items matched.")
}





















