import UIKit

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "Uma classe simples."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "Agora ajustada."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "Uma struct simples"
    mutating func adjust() {
        simpleDescription += "Ajustada."
    }
}

var b = SimpleStruct()
b.adjust()
let bDescription = b.simpleDescription

protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        //Implementação
    }
}

protocol AnotherProtocol {
    init()
}

class SomeSuperClass {
    init() {
        //Implementação
    }
}

class SomeSubClass: SomeSuperClass, AnotherProtocol {
    required override init() {
        //Implementação
    }
}

protocol RandomNumberProtocol {
    func random() -> Double
}

class RandomNumber: RandomNumberProtocol {
    func random() -> Double {
        return Double.random(in: 1.0...6.0)
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberProtocol
    
    init(sides: Int, generator: RandomNumberProtocol){
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var random = Dice(sides: 6, generator: RandomNumber())
for _ in 1...5 {
    print("O lançamento de dados aleatório é: \(random.roll())")
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SomeType {
    var number: Int = 7
}

extension SomeType {
    //Muda ou Adiciona novas funcionalidades
}

extension SomeType: ExampleProtocol {
    var simpleDescription: String {
        return "O numero é \(number)"
    }
    
    func adjust() {
        number += 42
    }
}

var someType = SomeType()
print(someType.simpleDescription)

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("Uma pelagada é \(oneInch) metros")
let threeFeet = 3.ft
print("Três pés são \(threeFeet) metros")

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions {
    print("Hello!")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]
746381295[1]
746381295[2]
746381295[8]

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
0.kind
10.kind
132.kind

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
