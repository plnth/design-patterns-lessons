import Foundation

protocol BirdProtocol {
    func sing()
    func fly()
}

class Bird: BirdProtocol {
    func sing() {
        debugPrint("tew tew")
    }
    
    func fly() {
        debugPrint("omg I am flying")
    }
}

class Raven {
    func flySearchAndDestroy() {
        debugPrint("destroy")
    }
    
    func voice() {
        debugPrint("Kar kar")
    }
}

class RavenAdapter: BirdProtocol {
    private var raven: Raven
    
    init(adaptee: Raven) {
        self.raven = adaptee
    }
    
    func sing() {
        raven.voice()
    }
    
    func fly() {
        raven.flySearchAndDestroy()
    }
}

func testBird(bird: BirdProtocol) {
    bird.fly()
    bird.sing()
}

func testAdapterPattern () {
    let simpleBird = Bird()
    let simpleRaven = Raven()
    let ravenAdapter = RavenAdapter(adaptee: simpleRaven)
    
    testBird(bird: simpleBird)
    testBird(bird: ravenAdapter)
}
