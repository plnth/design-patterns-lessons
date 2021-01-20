import Foundation

enum BowtieColor {
    case red, blue
}

class BowtieFactory {
    
    static let defaultFactory = BowtieFactory()
    
    func createBowtie(color: BowtieColor) -> Bowtie {
        switch color {
        case .red:
            return RedBowtie()
        case .blue:
            return BlueBowtie()
        }
    }
}
