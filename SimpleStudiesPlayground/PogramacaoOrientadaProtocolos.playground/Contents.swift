import UIKit

protocol Bird: CustomStringConvertible {
    var name: String { get }
    var canFly: Bool { get }
}

protocol Flyable {
    var maximumSpeed: Double { get }
}

struct Parrot: Bird, Flyable {
    let name: String
    let amplitude: Double
    let frequency: Double
    let canFly: Bool = true
    
    var maximumSpeed: Double {
        3 * amplitude * frequency
    }
}

let parrot = Parrot(name: "Papagaio", amplitude: 12.0, frequency: 5.0)
print("O \(parrot.name) voa na velocidade maxima de \(parrot.maximumSpeed) km/h")


struct Penguin: Bird {
    let name: String
    let canFly: Bool = false
}

let penguin = Penguin(name: "Pinguim")
print("\(penguin.name) é um passaro que voa? \(penguin.canFly ? "Sim!" : "Não!")")

extension Bird {
    var canFly: Bool { self is Flyable }
}

struct Dove: Bird, Flyable {
    let name: String
    let amplitude: Double
    let frequency: Double
    
    var maximumSpeed: Double {
        2 * amplitude * frequency
    }
}

struct Ostrich: Bird {
    let name: String
}

let dove = Dove(name: "Pombo", amplitude: 9.0, frequency: 2.0)
print("O \(dove.name) voa? \(dove.canFly ? "Sim!" : "Não!")")
print("O \(dove.name) voa a \(dove.maximumSpeed) km/h")

let ostrich = Ostrich(name: "Avestruz")
print("O \(ostrich.name) voa? \(ostrich.canFly ? "Sim!" : "Não!")")

//MARK: UTILIZANDO ENUM

enum Swallow: Bird, Flyable {
    case african
    case european
    case unknown
    
    var name: String {
        switch self {
        case .african:
            return "Andorinha Africana"
        case .european:
            return "Andorinha Europeia"
        case .unknown:
            return "Andorinha"
        }
    }
    
    var maximumSpeed: Double {
        switch self {
        case .african:
            return 10.0
        case .european:
            return 8.0
        case .unknown:
            fatalError("Nao sabemos a velocidade da Andorinha")
        }
    }
}

extension Swallow {
    var canFly: Bool {
        self != .unknown
    }
}

Swallow.unknown.canFly
Swallow.african.canFly
Penguin(name: "Pinguim").canFly

//Extensao Condicional

extension CustomStringConvertible where Self: Bird {
    var description: String {
        canFly ? "Pode voar" : "Não pode voar"
    }
}

print(Swallow.african)
print(Swallow.unknown)

//Utilizando Classes - Modelagem Retroativa

class Motorcycle {
    var name: String
    var speed: Double
    
    init(name: String) {
        self.name = name
        speed = 200.0
    }
}

protocol Racer {
    var speed: Double { get }
}

extension Parrot: Racer {
    var speed: Double {
        maximumSpeed
    }
}

extension Penguin: Racer {
    var speed: Double {
        42
    }
}

extension Swallow: Racer {
    var speed: Double {
        canFly ? maximumSpeed : 0.0
    }
}

extension Motorcycle: Racer {}

let racers: [Racer] = [
    Swallow.african,
    Swallow.unknown,
    Swallow.european,
    Penguin(name: "Pinguim"),
    Parrot(name: "Papagaio", amplitude: 12.0, frequency: 5.0),
    Motorcycle(name: "André")
]

func topSpeed(of racers: [Racer]) -> Double {
    racers.max (by: { $0.speed < $1.speed })?.speed ?? 0.0
}

print("Velocidade maxima dos pilotos \(topSpeed(of: racers))")

extension Sequence where Iterator.Element == Racer {
    
    func topSpeed() -> Double {
        self.max (by: { $0.speed < $1.speed })?.speed ?? 0.0
    }
}

print("Velocidade maxima dos pilotos \(racers.topSpeed())")
print("Velocidade maxima entre os 3 primeiros pilotos \(racers[1...3].topSpeed())")

protocol Cheat {
    mutating func boost(_ power: Double)
}

struct SwiftBird: Bird, Flyable {
    var name: String { "Swift \(version)" }
    let version: Double
    private var speedFactor = 1000.0
    
    var maximumSpeed: Double {
        version * speedFactor
    }
    
    init(version: Double) {
        self.version = version
    }
}

extension SwiftBird: Cheat {
    mutating func boost(_ power: Double) {
        speedFactor += power
    }
}

var swiftBird = SwiftBird(version: 5.0)
print("Velocidade = \(swiftBird.maximumSpeed)")
swiftBird.boost(3.0)
print("Velocidade = \(swiftBird.maximumSpeed)")
swiftBird.boost(3.0)
print("Velocidade = \(swiftBird.maximumSpeed)")

