import UIKit

class BowtieController: UIViewController {

    private let bowtieView = BowtieView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(self.bowtieView)
        createBowtie(color: .blue)
    }
    
    func createBowtie(color: BowtieColor) {
        let bowtie = BowtieFactory.defaultFactory.createBowtie(color: color)
        if let image = UIImage(named: bowtie.color) {
            self.bowtieView.imageView.image = image
            self.bowtieView.nameLabel.text = bowtie.color.uppercased()
        }
    }
}

