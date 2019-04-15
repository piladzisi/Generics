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
