import Foundation

public protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    public func copy() -> Self {
        return type(of: self).init(self)
    }
}

class Person: Copying {
    
    var name: String

    init(name: String) {
        self.name = name
    }
    
    required convenience init(_ prototype: Person) {
        self.init(name: prototype.name)
    }
}

func testPrototypePattern() {
    
    let person1 = Person(name: "Jim")
    debugPrint(person1.name)
    
    let person2 = person1.copy()
    person2.name = "Jack"
    debugPrint(person2.name)
    
    debugPrint(person1 === person2)
}
