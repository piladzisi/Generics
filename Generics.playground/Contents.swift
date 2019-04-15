//Generics

func swapInts(_ a: inout Int, _ b: inout Int) { //passing memory address assigned to a/b
    let tempA = a
    a = b
    b = tempA
}

var d = 10
var e = 12

swapInts(&d, &e)

d
e

var g = "anna"
var h = "lada"

func swapString(_ a: inout String, _ b: inout String) {
    let tempA = a
    a = b
    b = tempA
}
swapString(&g, &h)

func swapAny(_ a: inout Any, _ b: inout Any) {
    let tempA = a
    a = b
    b = tempA
}

//GENERIC FUNCTION
func swapValues<T>(_ a: inout T, _ b: inout T){
    let tempA = a
    a = b
    b = tempA
}

swapValues(&d, &e)
swapValues(&g, &h)
g
h

func clone<T>(item: T, numberOfTimes: Int) -> [T] {
    var array: [T] = [T] ()
    for _ in 1...numberOfTimes {
        array.append(item)
    }
    return array
}

clone(item: "anna", numberOfTimes: 6)

func transform<T, U>(arg: T, operation: (T) -> U) -> U {
    return operation (arg)
}

func stringToInt(_ a: String) -> Int {
    guard let value = Int(a) else { fatalError() }
    return value
}

transform(arg: "1", operation: stringToInt)

func intToString(_ a: Int) -> String {
    return String(a)
}

transform(arg: 12, operation: intToString)

func map<T, U>(array: [T], transformation: (T) -> U) -> [U] {
    var newArray = [U]()
    
    for values in array {
        newArray.append(transformation(values))
    }
    return newArray
}

func findKey<Key, Value: Equatable>(for value: Value, in dictionary: Dictionary<Key, Value>) -> Key? {
    for (iterKey, iterValue) in dictionary {
        if iterValue == value {
            return iterKey
        }
    }
    return nil
}

struct Item {
    let price: Int
    let quantity: Int
}

let airportCodes = ["CDG": "Charles de Gaulle", "HKG": "Hong Kong International Airport"]

findKey(for:"Hong Kong International Airport", in: airportCodes)

enum Snack {
    case gum
    case cookie
}

struct Product {
    let price: Int
    let quantity: Int
}
extension  Product: Equatable {
    static func ==(lhs: Product, rhs: Product) -> Bool{
        return lhs.price == rhs.price && lhs.quantity == rhs.quantity
    }
}

let inventory: [Snack: Product] = [
    .gum: Product(price: 1, quantity: 5),
    .cookie: Product(price: 2, quantity: 3)
]
let someProduct = Product(price: 2, quantity: 3)

findKey(for: someProduct, in: inventory)

//class Constraints

class Shape {}

func center<T: Shape>(of shape: T) {
    print("Called")
}
let testShape = Shape()
center(of: testShape)

class Square: Shape {}
let testSquare = Square()
center(of: testShape)

//class View {}
//let testView = View ()
//center(of: testView)


func largest<T: Comparable>(in array: [T]) -> T? {
    var largest: T?
    
    if let largestNum = array.max() {
        largest = largestNum
    } else {
        return nil
    }
    return largest
}

largest(in: [3,5,7,23])


//MARK: Generic Types

var numbers: [Int] = []
var numbers2 = Array<Int>()

let city = "Boston"
let streetName = Optional.some("123 Street")

var errorCodes = Dictionary<Int, String>()

//Linked Lists

class LinkedListNode<Key> {
    let key: Key
    
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    init (key: Key) {
        self.key = key
    }
}

class LinkedList<Element>: CustomStringConvertible {
    typealias Node = LinkedListNode<Element>
    
    private var head: Node?
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        if var node = head {
            while node.next != nil {
                node = node.next!
            }
            return node
        } else {
            return nil
        }
    }
    func append(_ value: Element) {
        let new = Node(key: value)
        
        if let lastNode = last {
            lastNode.next = new
            new.previous = lastNode
        } else {
            head = new
        }
    }
    
    func node(atIndex index: Int) -> Node {
        var node = head
        
        var counter = 0
        while node != nil {
            if counter == index { return node! }
            
            counter += 1
            node = node!.next
        }
        fatalError("Index out of bounds")
    }
    func insert(_ value: Element, at index: Int) {
        let nodeAtIndex = node(atIndex: index)
        let nodeBeforeIndex = nodeAtIndex.previous
        
        let new = Node(key: value)
        new.previous = nodeBeforeIndex
        new.next = nodeAtIndex
        
        nodeAtIndex.previous = new
        nodeBeforeIndex?.next = new
        
        if nodeBeforeIndex == nil {
            head = new
        }
    }
    var description: String {
        var output = "["
        var node = head
        while node != nil {
            output += "\(node!.key)"
            node = node!.next
            if node != nil { output += ", "}
        }
        return output + "]"
    }
}

let list = LinkedList<String>()

list.append("Swift")
list.append("Language")
list.insert("Programming", at: 1)
list.node(atIndex: 1).key

class LinkedIntegers: LinkedList<Int> {}

let newList = LinkedIntegers()
newList.append(1)


struct Queue<Element> {
    var array = [Element]()
    var isEmpty: Bool {
        if array.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func enqueue(_ item: Element) {
        self.array.append(item)
    }
    
    mutating func dequeue() -> Element? {
        if self.array.isEmpty == false {
            return self.array.remove(at: 0)
        } else {
            return nil
        }
        
    }
}



