import Foundation

class BedroomFactory: AbstractFactory {
    func createChair() -> Chair {
        debugPrint("Bedroom chair was created")
        return BedroomChair()
    }
    
    func createSofa() -> Sofa {
        debugPrint("Bedroom chair was created")
        return BedroomSofa()
    }
    
    func createTable() -> Table {
        debugPrint("Bedroom table was created")
        return CoffeeTable()
    }
}
