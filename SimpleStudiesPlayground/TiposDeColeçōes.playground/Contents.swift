import UIKit

//MARK: ARRAYS

var someInts: [Int] = []
print("someInts é do tipo [Int] com \(someInts.count) itens")

someInts.append(3)
someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList: [String] = ["Ovos", "Leite"]
print("A lista de compras contém \(shoppingList.count) itens.")

if shoppingList.isEmpty {
    print("A lista de compras está vazia.")
} else {
    print("A lista de compras não está vazia")
}

shoppingList.append("Farinha")
shoppingList += ["Fermento em pó"]
shoppingList += ["Pasta de Chocolate", "Queijo", "Manteiga"]

var firstitem = shoppingList[0]
shoppingList[0] = "Seis ovos"
shoppingList[4...6] = ["Bananas", "Maças"]
print(shoppingList)

shoppingList.insert("Xarope de bordo", at: 0)
print(shoppingList)

let mapleSyrup = shoppingList.remove(at: 0)
print(shoppingList)
print(mapleSyrup)

firstitem = shoppingList[0]

let apple = shoppingList.removeLast()
print(shoppingList)
print(apple)

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//MARK: SETS

var letters = Set<Character>()
print("letters é do tipo Set<Character> com \(letters.count) itens.")

letters.insert("a")
letters = []

var favoriteGenres: Set<String> = ["Rock", "Classico", "Hip Hop"]
var newFavoriteGenres: Set = ["Rock", "Classico", "Hip Hop"]

print("Eu tenho \(favoriteGenres.count) generos musicais favoritos.")

if favoriteGenres.isEmpty {
    print("Sou ecletico.")
} else {
    print("Tenho gostos peculiares.")
}

favoriteGenres.insert("Blues")
print(favoriteGenres.count)

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? nao gosto mais.")
} else {
    print("Nunca gostei muito desse")
}

if favoriteGenres.contains("Funk") {
    print("Eu me levanto para rebolar")
} else {
    print("Está muito badalado hoje")
}

print(favoriteGenres.count)

print("Sem ordenaçao")
for genre in favoriteGenres {
    print("\(genre)")
}

print("Ordenado")
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

//MARK: CONJUNTOS

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitsPrimeNumber: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitsPrimeNumber).sorted()
oddDigits.symmetricDifference(singleDigitsPrimeNumber).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)


//MARK: DICIONARIOS

var namesOfIntegers: [Int: String] = [:]
namesOfIntegers[16] = "dezesseis"
namesOfIntegers = [:]

var airports: [String: String] = ["CWB": "Curitiba", "BSB": "Brasilia"]
var literalAirports = ["CWB": "Curitiba", "BSB": "Brasilia"]

print("O dicionario de aeroportos contem \(airports.count) itens")

if airports.isEmpty {
    print("O dicionario esta vazio")
} else {
    print("O dicionario nao esta vazio")
}

airports["GRU"] = "Guarulhos"
print(airports.count)

airports["CWB"] = "Curitiba Vina"

if let oldValue = airports.updateValue("Brasilia Souza", forKey: "BSB") {
    print("O valor antigo para BSB era \(oldValue)")
}

if let airportName = airports["GRU"] {
    print("O nome do aeroporto é \(airportName)")
} else {
    print("Nao temos esse aeroporto no dicionario")
}

airports["APL"] = "Apple International"
print(airports)
airports["APL"] = nil
print(airports)

if let removeValue = airports.removeValue(forKey: "BSB") {
    print("O nome do aeroporto removido é \(removeValue)")
} else {
    print("O dicionario nao contem valor para BSB")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Codigo do aeroporto: \(airportCode)")
}

for airportName in airports.values {
    print("O nome do aeroporto: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
