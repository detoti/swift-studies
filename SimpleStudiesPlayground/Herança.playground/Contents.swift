import UIKit

class Person {
    var age: Int
    var gender: String
    var color: String
    var maritialStatus: String
    
    init(age: Int, gender: String, color: String, maritialStatus: String) {
        self.age = age
        self.gender = gender
        self.color = color
        self.maritialStatus = maritialStatus
    }
    
    func play(sport: String) {
        print("Esporte: \(sport)")
    }
    
    func play(instrument: String) {
        print("Instumento: \(instrument)")
    }
}

class Men: Person {
    
}

let andy = Men(age: 30, gender: "Masculino", color: "Branco", maritialStatus: "Solteiro")
print(andy.age)

class FootballPlayer: Person {
    override func play(sport: String) {
        print("Jogador de \(sport)")
    }
}

let footballPlayer = FootballPlayer(age: 43, gender: "Male", color: "Black", maritialStatus: "Married")
footballPlayer.play(sport: "Futebol")

class Pilot: Person {
    override func play(sport: String) {
        print("Piloto de \(sport)")
    }
}

let pilot = Pilot(age: 22, gender: "Male", color: "Amarelo", maritialStatus: "Divorciado")
pilot.play(sport: "Formula 1")
