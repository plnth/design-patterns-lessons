import UIKit
import SnapKit

class OrdersViewController: UIViewController {
    
    private var chair: Chair?
    private var table: Table?
    private var sofa: Sofa?
    
    private lazy var orderForKitchenButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("For kitchen", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(onOrderForKitchen), for: .touchUpInside)
        return btn
    }()
    
    private lazy var orderForBedroomButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("For bedroom", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.addTarget(self, action: #selector(onOrderForBedroom), for: .touchUpInside)
        return btn
    }()
    
    private let orderForKitchenPicture: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "kitchen.png")
        return iv
    }()
    
    private let orderForBedroomPicture: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bedroom.png")
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupSubviews()
    }
    
    private func addSubviews() {
        self.view.addSubview(self.orderForKitchenPicture)
        self.view.addSubview(self.orderForKitchenButton)
        self.view.addSubview(self.orderForBedroomPicture)
        self.view.addSubview(self.orderForBedroomButton)
    }
    
    private func setupSubviews() {
        self.orderForKitchenPicture.snp.makeConstraints { make in
            make.leading.trailing.centerX.equalToSuperview().inset(40)
            make.top.equalToSuperview().inset(120)
            make.height.equalTo(200)
        }
        
        self.orderForBedroomPicture.snp.makeConstraints { make in
            make.leading.trailing.centerX.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(120)
            make.height.equalTo(200)
        }
        
        self.orderForKitchenButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.orderForKitchenPicture)
            make.top.equalTo(self.orderForKitchenPicture.snp.bottom)
            make.height.equalTo(40)
        }
        
        self.orderForBedroomButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.orderForBedroomPicture)
            make.top.equalTo(self.orderForBedroomPicture.snp.bottom)
            make.height.equalTo(40)
        }
    }
    
    @objc private func onOrderForKitchen() {
        let kitchenFactory = KitchenFactory()
        self.chair = kitchenFactory.createChair()
        self.table = kitchenFactory.createTable()
        self.sofa = kitchenFactory.createSofa()
    }
    
    @objc private func onOrderForBedroom() {
        let bedroomFactory = BedroomFactory()
        self.chair = bedroomFactory.createChair()
        self.table = bedroomFactory.createTable()
        self.sofa = bedroomFactory.createSofa()
    }
}
