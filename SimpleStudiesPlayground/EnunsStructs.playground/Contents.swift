import UIKit

//MARK: ENUM

enum Rank: Int {
    case ace = 1
    case two, three, four, fice, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "Espadas"
        case .hearts:
            return "Coração"
        case .diamonds:
            return "Diamante"
        case .clubs:
            return "Paus"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let sucess = ServerResponse.result("6:00 am", "7:03 pm")
let failure = ServerResponse.failure("Fora do Intervalo")

switch sucess {
case let .result(sunrise, sunset):
    print("O nascer do sol será as \(sunrise) e o por do sol será as \(sunset)")
case let .failure(message):
    print("Falha... \(message)")
}

//MARK: STRUCTS

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "O \(rank.simpleDescription()) do \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
