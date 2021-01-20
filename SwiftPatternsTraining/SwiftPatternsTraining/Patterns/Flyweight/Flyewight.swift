import UIKit

extension UIColor {
    static var colorStore: [String: UIColor] = [:]
    
    class func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
        let key = "\(red)\(green)\(blue)\(alpha)"
        if let color = colorStore[key] {
            return color
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        colorStore[key] = color
        return color
    }
    
}

func checkRefs() {
    let red = UIColor.blue
    let red2 = UIColor.blue
    
    debugPrint(red === red2)
    
    let color = UIColor(displayP3Red: 0, green: 0, blue: 1, alpha: 1)
    let color2 = UIColor(displayP3Red: 0, green: 0, blue: 1, alpha: 1)
    
    debugPrint(color === color2)
    
    let flyColor = UIColor.rgba(0, 0, 1, 0)
    let flyColor2 = UIColor.rgba(0, 0, 1, 0)
    debugPrint(flyColor === flyColor2)
}
