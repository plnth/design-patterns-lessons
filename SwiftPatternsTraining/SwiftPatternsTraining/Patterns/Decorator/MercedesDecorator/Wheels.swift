import Foundation

class Wheels: MercedesDecorator {
    required init(decorator: MercedesProtocol) {
        super.init(decorator: decorator)
    }
    
    override func getTitle() -> String {
        return super.getTitle() + "premium wheels"
    }
    
    override func getPrice() -> Double {
        return super.getPrice() + 1500
    }
}

