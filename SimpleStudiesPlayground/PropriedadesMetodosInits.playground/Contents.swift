import UIKit

class Person {
    var age: Int!
    var gender: String!
    var color: String!
    var maritalStatus: String!
}

class BehaviorPerson {
    var age: Int!
    var gender: String!
    var color: String!
    var maritalStatus: String!
    
    func play(sport: String) {
        //Como sua instancia da pessoa irá jogar
    }
}

class Wall {
    init() {
        // executa a inicializacao
    }
}

class WhiteWall {
    var lenght: Double
    
    init() {
        lenght = 5.5
        print("Criamos o objeto wall.")
        print("Lenght = ", lenght)
    }
}

var whiteWall = WhiteWall()

class BlackWall {
    var lenght: Double
    
    init(lenght: Double) {
        self.lenght = lenght
        print("Criamos o objeto wall.")
        print("Lenght = ", lenght)
    }
}

var blackWall = BlackWall(lenght: 10.5)

class LongWall {
    var length: Double
    var height: Double
    
    init(lenght: Double, height: Double) {
        self.length = lenght
        self.height = height
        print("A area é \(calculateArea())")
    }
    
    func calculateArea() -> Double {
        return length * length
    }
}

var longWall1 = LongWall(lenght: 20.5, height: 8.6)
var longWall2 = LongWall(lenght: 8.5, height: 6.3)


class PersonAge {
    var age: Int
    
    init() {
        age = 20
    }
    
    init(age: Int) {
        self.age = age
    }
    
    func getAge() -> Int {
        return age
    }
}

var personAge1 = PersonAge()
print("Person 1 Age:", personAge1.getAge())
var personAge2 = PersonAge(age: 30)
print("Person 2 Age:", personAge2.getAge())

class University {
    var name: String
    var rank: String
    
    init(name: String, rank: String) {
        self.name = name
        self.rank = rank
    }
    
    convenience init() {
        self.init(name: "Belas Artes", rank: "1")
    }
}

var university = University()
print(university.name)
print(university.rank)

class File {
    var folder: String
    
    init?(folder: String) {
        if folder.isEmpty {
            print("Folder not found")
            return nil
        }
        self.folder = folder
    }
}

var file = File(folder: "")
if file != nil {
    print("Arquivo encontrado com sucesso")
} else {
    print("Erro ao buscar")
}

struct PersonStruct {
    var name: String
    var age: Int
}

var personStruct = PersonStruct(name: "André", age: 30)
print("Nome: ", personStruct.name)
print("Idade: ", personStruct.age)
