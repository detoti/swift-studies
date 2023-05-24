import UIKit

//Classe sempre declarar com letra maïuscula
class Shape {
    //Corpo da Classe
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "Uma forma com \(numberOfSides) lados."
    }
}

var shape = Shape()
shape.numberOfSides = 7

var shapedDescription = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "Uma forma com \(numberOfSides) lados."
    }
}

//MARK: Utilizando Super Classes

class Square: NamedShape {
    var sideLenght: Double
    
    init(sideLenght: Double, name: String) {
        self.sideLenght = sideLenght
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLenght * sideLenght
    }
    
    override func simpleDescription() -> String {
        return "Um quadrado com lados de comprimento \(sideLenght)."
    }
}

let test = Square(sideLenght: 5.2, name: "Meu quadrado de teste")
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLenght: Double = 0.0
    
    var perimeter: Double {
        get { return 3.0 * sideLenght }
        set { sideLenght = newValue / 3.0 }
    }
    
    init(sideLenght: Double, name: String) {
        self.sideLenght = sideLenght
        super.init(name: name)
        numberOfSides = 3
    }
    
    override func simpleDescription() -> String {
        return "Um triangulo equilatero com lados de comprimento \(sideLenght)"
    }
}
var triangle = EquilateralTriangle(sideLenght: 3.1, name: "Um triangulo equilatero")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLenght)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            triangle.sideLenght = newValue.sideLenght
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLenght = newValue.sideLenght
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLenght: size, name: name)
        triangle = EquilateralTriangle(sideLenght: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "teste")
print(triangleAndSquare.square.sideLenght)
print(triangleAndSquare.triangle.sideLenght)
triangleAndSquare.square = Square(sideLenght: 50, name: "Quadrado Maior")
print(triangleAndSquare.triangle.sideLenght)

let optionalSquare: Square? = Square(sideLenght: 2.5, name: "quadrado")
let sideLenght = optionalSquare?.sideLenght
