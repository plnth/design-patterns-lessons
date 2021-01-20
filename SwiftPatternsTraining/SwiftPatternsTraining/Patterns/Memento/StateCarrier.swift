import Foundation

class StateCarrier {
    var state: LinesStateMemento?
    var linesManager: LinesManager
    
    init(linesManager: LinesManager) {
        self.linesManager = linesManager
    }
    
    public func saveLine() {
        state = linesManager.save()
    }
    
    func loadLine() {
        guard let state = state else { return }
        linesManager.load(state: state)
    }
}
