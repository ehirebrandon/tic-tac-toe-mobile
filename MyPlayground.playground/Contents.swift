//: Playground - noun: a place where people can play

import UIKit
import Foundation

class ClassA {
    // takes a closure (non-escaping by default)
    func someMethod(closure: () -> Void) {
        // secret stuff
    }
}

class ClassB {
    let classA = ClassA()
    var someProperty = "Hello"
    
    func testClosure() {
        classA.someMethod {
            // self is captured!
            someProperty = "Inside the closure!"
        }
    }
    
    func viewDidLoad(){
        
    testClosure()
    print(someProperty)
        
    }
}
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

var c = Container()