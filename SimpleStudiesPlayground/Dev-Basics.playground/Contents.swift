import UIKit

// Sample Values
var greeting = "Hello, future"
var myVariable = 42
myVariable = 84
myVariable = 84*2
let myConstant = 21

let implicInteger = 10
let implicDouble = 20.0
let explicDouble: Double = 30.0
let explicInterger: Int = 40
let explicFloat: Float = 50

let label = "This widht is "
let width = 94
let labelwidth = label + String(width)

let apples = 3
let oranges = 5
let grapes = 2
let appleSummary = "I have \(apples) apples."
let orangesSummary = "I have \(oranges) oranges."
let pearsSummary = "I have \(grapes) grapes."

let qutation = """
I said "I have \(apples) apples."
And then I said "I have \(oranges) oranges."
"""

var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcom": "Captain",
    "Kyle": "Mechanic"
    ]
occupations["Jayne"] = "Public Relations"

let emptyArray: [String] = []
let emptyDic: [String: Float] = [:]

// Seguir Documentacao do Swift Tools

// Control Flow

let individualScore = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScore {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "Larissa"
var greetings = "Hello!"
if let name = optionalName {
    greetings = "Hello, \(name)"
}

let nickname: String? = nil
let fullName: String = "Larissa Assunção"
let informalGreeting = "Hi \(nickname ?? fullName)"

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("put some sauce")
case "cucumber":
    print("sit on it")
case let x where x.hasSuffix("pepper"):
print("make some hot honey")
default:
    print("soup is not dinner")
}

let interstingNumber = [
    "Prime": [2, 3, 5, 11, 13],
    "Fibtonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
var key = ""
for (_key, numbers) in interstingNumber {
    for number in numbers {
        if number > largest {
            largest = number
            key = _key
        }
    }
}
print(largest)
print(key)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
}while m < 100
print(m)

var total = 0
for i in 0..<4 {
   total += i
}
print(total)

// Functions and Clorsures

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet(person: "Lari", day: "Monday")

func calculateStatics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return(min, max, sum)
}
let statitics = calculateStatics(scores: [5, 3, 100, 3, 9])
print(statitics.sum)
print(statitics.2)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

let mapperNumbers = numbers.map({ number in 3 * number })
print(mapperNumbers)

let sortedNumbers = numbers.sorted {$0 > $1}
print(sortedNumbers)

// Objects and Class

class Shape {
    var numberOfSides: Int = 0
       func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    }
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


//SuperClass
class NamedShape {
    var numberOfSides: Int = 0
    let name: String
    
    init(name: String) {
        self.name = name
        }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    }
var namedShape = NamedShape(name: "shape")
namedShape.numberOfSides = 7
var namedShapeDescription = namedShape.simpleDescription()

//SubClass
class Square: NamedShape {
    var sideLenght: Double
    
    init(sideLenght: Double, name: String){
        self.sideLenght = sideLenght
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double{
        return sideLenght * sideLenght
    }
    override func simpleDescription() -> String {
        return "A square with sides of lenght \(sideLenght)."
    }
}
let square = Square(sideLenght: 5.2, name: "my test square")
square.area()
square.simpleDescription()

class EquilaterlTriangle: NamedShape {
    var sideLenght: Double = 0.0
    
    init(sideLenght: Double, name: String) {
        self.sideLenght = sideLenght
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLenght
        }
        set {
            sideLenght = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of lenght \(sideLenght)."
    }
}
var triangle = EquilaterlTriangle(sideLenght: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLenght)

class TriangleAndSquare {
    var triangle: EquilaterlTriangle {
        willSet {
            square.sideLenght = newValue.sideLenght
        }
    }
    var square: Square {
        willSet {
            triangle.sideLenght = newValue.sideLenght
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLenght: size, name: name)
        triangle = EquilaterlTriangle(sideLenght: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLenght)
print(triangleAndSquare.triangle.sideLenght)
triangleAndSquare.square = Square(sideLenght: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLenght)

// Enums and Structures

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return "\(self.rawValue)" //ou String(self.rawValue)
            
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
let aceDescription = ace.simpleDescription() // aspas representam string no resultado
let king = Rank.king.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let heart = Suit.hearts
let spade = Suit.spades
let diamond = Suit.diamonds
let clubs = Suit.clubs
let heartDescription = heart.simpleDescription()

enum ServerReponse {
    case result(String, String)
    case failure(String)
    
}
let success = ServerReponse.result("5:49 am", "18:37 pm")
let error = ServerReponse.failure("No donuts for you")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise at \(sunrise) and sunset at \(sunset)")
case let .failure(message):
    print("Error... \(message)")
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// Bonus topic
// Diferença entre Class e Struct na pratica

class GoogleSheet {
    var author: String
    init(author: String){
        self.author = author
    }
}
let file = GoogleSheet(author: "Larissa")
let authot = file.author
let fileChange = file
fileChange.author = "André"
let authorChange = fileChange.author
print(file.author)

struct Excel {
    var author: String
}
let fileExcel = Excel(author: "Larissa")
var fileExcelChanged = fileExcel
fileExcelChanged.author = "André"
print(fileExcel.author)

//Protocol and Extensions

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProp: Int = 349
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
     
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleSrut: ExampleProtocol {
    var simpleDescription: String = "A very simple strut"
    
    mutating func adjust() {
        simpleDescription += " ajusted"
    }
}
var b = SimpleSrut()
b.adjust()
let bDescription = b.simpleDescription
//Nao entendi porque nao funcionou.
//extension Int: ExampleProtocol {
//    var simpleDescription: String {
//        return "The number \(self)"
//    }
//    mutating func adjust() {
//        self += 42
//    }
//}
//print(7.simpleDescription)
//let protocolValue: ExampleProtocol = a
//print(protocolValue.simpleDescription)

//Error Handling
enum PrintErrors: Error {
case outOfPaper
case outOfToner
case onFire
}

func send(job: Int, toPrint printerName: String) throws -> String {
    if printerName == "No Toner" {
        throw PrintErrors.outOfToner
    }
        return "Job Sent"
}
do {
    let printResponse = try send(job: 104, toPrint: "Tcc")
    print(printResponse)
} catch PrintErrors.onFire {
    print("Ta pegando fogo bixo")
} catch let printerError as PrintErrors {
    print("Printer Error: \(printerError)")
}

let printerSuccess = try? send(job: 105, toPrint: "Projeto")
let printerFailure = try? send(job: 106, toPrint: "No Toner")

var fridgeOpen = false
var fridgeContent = ["milk, eggs", "leftovers"]

func fridge(_ food: String) -> Bool {
    fridgeOpen = true
    defer {
        fridgeOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
fridge("banana")
print(fridgeOpen)

//Generics

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 3)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element {
    
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])
