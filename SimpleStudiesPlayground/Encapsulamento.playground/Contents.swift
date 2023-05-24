import UIKit


// Acesso Private
class Maths {
    let a: Int!
    let b: Int!
    
    //Encapsulado
    private var result: Int?
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
    
    func add() {
        result = a + b
    }
    
    func displayResult(){
        print("Result = \(result ?? 0)")
    }
}

let calculation = Maths(a: 10, b: 10)
calculation.add()
calculation.displayResult()

//Open

open class OpenClass{
    open var age: Int = 30
    open func play(sport: String) {}
}

//Publico
public class PublicClass{
    public var age: Int = 30
    public func play(sport: String) {}
}

//Interno
internal class InternalClass {
    internal var age: Int = 30
    internal func play(sport: String) {}
}

//File-Private
fileprivate class FilePrivateClass{
    fileprivate var age: Int = 30
    fileprivate func play(sport: String) {}
}

//Private
private class PrivateClass{
    private var age: Int = 30
    private func play(sport: String) {}
}
