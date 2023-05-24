import UIKit

func greet(person: String, day: String) -> String {
    //Bloco da Função
    return "Olá, \(person), hoje é \(day)."
}
greet(person: "André", day: "segunda-feira")

func greet(_ person: String, on day: String) -> String {
    //Bloco da Função
    return "Olá, \(person), hoje é \(day)."
}
greet("Larissa", on: "terça-feira")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    //Bloco da Função
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
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.0)
print(statistics.1)
print(statistics.2)

func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    add()
    
    return y
}
returnFifteen()

func makeIncrement() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrement()
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
    //Corpo da Closure
    let result = 3 * number
    return result
})

let mappedNumbers = numbers.map ({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
