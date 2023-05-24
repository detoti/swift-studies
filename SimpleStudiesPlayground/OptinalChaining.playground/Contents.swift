import UIKit

class Residence {
    var numberOfRooms = 1
    
}

class Person {
    var residence: Residence?
    
}

let joao = Person()

if let roomCount = joao.residence?.numberOfRooms {
    print("A residências do João tem \(roomCount) quarto(s)")
} else {
    print("Não foi possivel recuperar o numero de quartos.")
}

joao.residence = Residence()

if let roomCount = joao.residence?.numberOfRooms {
    print("A residências do João tem \(roomCount) quarto(s)")
} else {
    print("Não foi possivel recuperar o numero de quartos.")
}
