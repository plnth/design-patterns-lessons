import SnapKit

class BowtieView: UIView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(self.imageView)
        addSubview(nameLabel)
    }
    
    private func setupSubviews() {
        
        self.imageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(40)
            make.top.equalToSuperview().inset(40)
            make.height.equalTo(self.imageView.snp.width)
        }

        self.nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(10)
        }
    }
}
