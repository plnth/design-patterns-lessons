import UIKit

class DrawView: UIView {
    var stateCarrier: StateCarrier!
    
    var lineWidth: CGFloat = 0
    var lineColor: UIColor = .clear
    var startPoint: CGPoint = .zero
    var endPoint: CGPoint = .zero
    var path: UIBezierPath = .init(rect: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        lineWidth = 10.0
        let linesManager = LinesManager.shared
        stateCarrier = StateCarrier(linesManager: linesManager)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startPoint = touch?.location(in: self) ?? .zero
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        endPoint = touch?.location(in: self) ?? .zero
        
        stateCarrier.linesManager.linesArray.append(LineModel(start: startPoint, end: endPoint, color: lineColor))
        path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        startPoint = endPoint
        drawShapeLayer()
    }
    
    private func drawShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
}
