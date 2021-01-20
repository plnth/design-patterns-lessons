import Foundation

func testDecoratorPattern() {
    var mercedes: MercedesProtocol = MercedesCLA()
    mercedes = Wheels(decorator: mercedes)
    debugPrint(mercedes.getPrice())
}

class MercedesDecorator: MercedesProtocol {
    private let decoratorType: MercedesProtocol
    
    required init(decorator: MercedesProtocol) {
        self.decoratorType = decorator
    }
    func getTitle() -> String {
        return self.decoratorType.getTitle()
    }
    
    func getPrice() -> Double {
        return self.decoratorType.getPrice()
    }
}
