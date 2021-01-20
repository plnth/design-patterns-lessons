import Foundation

protocol MercedesProtocol {
    func getTitle() -> String
    func getPrice() -> Double
}

class MercedesCLA: MercedesProtocol {
    func getTitle() -> String {
        return "MercedesCLA"
    }
    
    func getPrice() -> Double {
        return 12000
    }
}
