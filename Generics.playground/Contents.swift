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
