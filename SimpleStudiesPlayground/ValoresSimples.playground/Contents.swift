import UIKit

/* Valores Simmples */
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitInteger: Int = 70
let explicitDouble: Double = 70.0

let label = "A largura é "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummmary = "Eu tenho \(apples) maças"
let fruitSummary = "Eu tenho \(apples + oranges) frutas"

let quotation = """
Eu disse "eu tenho \(apples) maças."
E entao eu disse: "eu tenho \(apples + oranges) frutas."
"""

var fruits = ["Morangos", "Limoes", "Tangerinas"]
fruits[1] = "Uvas"
var occupations = [
    "Joao": "Capitao",
    "Pedro": "Mecanico",
]
occupations["Maria"] = "Relaçoes Internacionais"
fruits.append("Amoras")

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

fruits = []
occupations = [:]

