import UIKit

class Player {
    let name: String
    
    init(name: String){
        self.name = name
    }
    
    func play() {
        print("Padrao")
    }
}

class Batsman: Player {
    override func play() {
       bat()
    }
    
    private func bat() {
        print("\(name) esta rebatendo")
    }
}

class Bowler: Player {
    
    override func play() {
        bowl()
    }
    
    private func bowl() {
        print("\(name) está jogando boliche")
    }
}

class CricketTeam {
    let name: String
    let team: [Player]
    
    init(name: String, team: [Player]) {
        self.name = name
        self.team = team
    }
    
    func play() {
        team.forEach { $0.play() }
    }
}

let maria = Batsman(name: "Maria")
let paulo = Bowler(name: "Paulo")
let rioCricket = CricketTeam(name: "Rio Cricket", team: [maria, paulo])
rioCricket.play()
