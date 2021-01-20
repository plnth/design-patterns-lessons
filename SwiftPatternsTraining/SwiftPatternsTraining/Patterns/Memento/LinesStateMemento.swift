import Foundation

class LinesStateMemento {
    var linesArray: [LineModel]
    
    init(lines: [LineModel]) {
        self.linesArray = lines
    }
}
