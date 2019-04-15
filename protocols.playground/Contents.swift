//MARK: Associated Types


protocol Stack {
    associatedtype Element
    
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
    
    var top: Element? { get }
}

struct IntStack: Stack {
    private var array = Array<Int>()
    
    mutating func push(_ element: Int) {
        array.append(element)
    }
    mutating func pop() -> Int? {
        return array.popLast()
    }
    var top: Int? {
        return array.last
    }
}

protocol ShoppingItem {
    var price: Double { get }
}

typealias HashableShoppingItem = Hashable & ShoppingItem //protocol composition

struct Checkout<Item: HashableShoppingItem> {
    var cart = [Item: Int]()
}

//MARK: where close 
class Shape {}

struct Animator<T> where T: Hashable, T: Shape {
    
}

