import Foundation

class KitchenFactory: AbstractFactory {
    func createChair() -> Chair {
        debugPrint("Kitchen chair was created")
        return KitchenChair()
    }
    
    func createSofa() -> Sofa {
        debugPrint("Kitchen chair was created")
        return KitchenSofa()
    }
    
    func createTable() -> Table {
        debugPrint("Kitchen table was created")
        return KitchenTable()
    }
}
