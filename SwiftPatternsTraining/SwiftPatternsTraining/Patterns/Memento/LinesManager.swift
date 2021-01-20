import UIKit

class LinesManager {
    static let shared = LinesManager()
    
    var linesArray = [LineModel]()
    
    func save() -> LinesStateMemento {
        return LinesStateMemento(lines: self.linesArray)
    }
    
    func load(state: LinesStateMemento) {
        self.linesArray = state.linesArray
    }
    
    func printLines(in view: UIView) {
        if let sublayers = view.layer.sublayers {
            for v in sublayers {
                v.removeFromSuperlayer()
            }
        }
        
        for line in linesArray {
            let path = UIBezierPath()
            path.move(to: line.start)
            path.addLine(to: line.end)
            drawShapeLayer(path, line.color, view)
        }
    }
    
    private func drawShapeLayer(_ path: UIBezierPath, _ lineColor: UIColor, _ view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shapeLayer)
        view.setNeedsDisplay()
    }
}
