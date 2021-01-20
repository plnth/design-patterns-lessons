import UIKit
import SnapKit

protocol Observer: class {
    func update(subject: MyNotificationCenter)
}

class ConcreteObserverA: Observer {
    func update(subject: MyNotificationCenter) {
        debugPrint("ConcreteObserverA: \(subject.state)")
    }
}

class MyNotificationCenter {
    var state: Int = {
        return Int(arc4random_uniform(10))
    }()
    
    private lazy var observers = [Observer]()
    
    func subscribe(_ observer: Observer) {
        debugPrint(#function)
        self.observers.append(observer)
    }
    
    func unsubscribe(_ observer: Observer) {
        if let index = observers.index(where: { $0 === observer }) {
            self.observers.remove(at: index)
        }
        debugPrint(#function)
    }
    
    func notify() {
        debugPrint(#function)
        self.observers.forEach { $0.update(subject: self) }
    }
    
    func someLogic() {
        debugPrint(#function)
        self.state = Int(arc4random_uniform(10))
        self.notify()
    }
}

class TrainingObserverViewController: UIViewController {

    private let outOneLabel: UILabel = {
        let label = UILabel()
        label.text = "Out"
        label.textColor = .black
        return label
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    private let subscribeSwitch: UISwitch = {
        let _switch = UISwitch()
        return _switch
    }()
    
    let myNotificationCenter = MyNotificationCenter()
    
    let concreteObserverA = ConcreteObserverA()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.outOneLabel)
        self.view.addSubview(self.updateButton)
        self.view.addSubview(self.subscribeSwitch)
        
        self.updateButton.addTarget(self, action: #selector(updateTapped), for: .touchUpInside)
        self.subscribeSwitch.addTarget(self, action: #selector(switchTapped), for: .valueChanged)
        
        self.outOneLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        self.updateButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.subscribeSwitch.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
             make.centerX.equalToSuperview()
        }
    }
    
    @objc func updateTapped() {
        self.myNotificationCenter.someLogic()
    }
    
    @objc func switchTapped() {
        if self.subscribeSwitch.isOn {
            myNotificationCenter.subscribe(concreteObserverA)
            myNotificationCenter.subscribe(self)
        } else {
            myNotificationCenter.unsubscribe(concreteObserverA)
            myNotificationCenter.unsubscribe(self)
        }
    }
}

extension TrainingObserverViewController: Observer {
    func update(subject: MyNotificationCenter) {
        self.outOneLabel.text = "Subject state: \(subject.state)"
    }
}
