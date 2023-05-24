import UIKit

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = "Olá"
print(optionalString == nil)

var optionalName: String? = "João Marcos"
var greeting = "Olá"
if let name = optionalName {
    greeting = "Olá, \(name)"
}

let nickname: String? = nil
let fullName: String = "Vicente Patricio"
let informalGreeting = "Oi \(nickname ?? fullName)"

if let nickname {
    print("Oi, \(nickname)")
}

let vegetable = "Pepino Japones"
switch vegetable {
case "Salsão":
    print("Adicione uva passa.")
case "Pimentao", "Agriao":
    print("Isso daria uma boa salada")
case let x where x.hasPrefix("Pepino"):
    print("Da pra fazer sunomono com \(x)?")
default:
    print("Sopa não é janta")
}

let interestingNumbers = [
    "Melhor": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Quadrado": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)
            
var total = 0
for i in 0...4 {
    total += i
}
print(total)
