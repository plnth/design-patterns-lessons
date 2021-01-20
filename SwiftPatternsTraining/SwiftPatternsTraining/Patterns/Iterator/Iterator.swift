import Foundation

indirect enum LinkedListNode<T> {
    case value(element: T, next: LinkedListNode<T>)
    case end
}

struct LinkedList<T> {
    var head: LinkedListNode<T>
    
    init(head: LinkedListNode<T>) {
        self.head = head
    }
}

func testIteratorPattern() {
    let elem4 = LinkedListNode.value(element: 4, next: .end)
    let elem3 = LinkedListNode.value(element: 3, next: elem4)
    let elem2 = LinkedListNode.value(element: 2, next: elem3)
    let elem1 = LinkedListNode.value(element: 1, next: elem2)
    let list = LinkedList(head: elem1)
    
    for i in list {
        debugPrint(i)
    }
}

extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T>  {
        return LinkedListIterator(current: head)
    }
}

struct LinkedListIterator<T>: IteratorProtocol {
    
    var current: LinkedListNode<T>
    
    mutating func next() -> T? {
        switch current {
        case let .value(element, next):
            current = next
            return element
        case .end:
            return nil
        }
    }
}
