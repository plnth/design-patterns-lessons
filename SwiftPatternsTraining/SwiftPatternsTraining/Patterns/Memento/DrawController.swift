import SnapKit

class DrawController: UIViewController {
    
    var stateCarrier: StateCarrier!
    var drawView: DrawView! //ouch
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupViews()
        let linesManager = LinesManager.shared
        stateCarrier = StateCarrier(linesManager: linesManager)
    }
    
    private func setupViews() {
        
        let actionsView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4))
        
        let saveBtn = UIButton()
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.setTitleColor(.black, for: .normal)
        actionsView.addSubview(saveBtn)
        saveBtn.addTarget(self, action: #selector(save), for: .touchUpInside)
        
        let loadBtn = UIButton()
        loadBtn.setTitle("Load", for: .normal)
        loadBtn.setTitleColor(.black, for: .normal)
        actionsView.addSubview(loadBtn)
        loadBtn.addTarget(self, action: #selector(load), for: .touchUpInside)
        
        saveBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().dividedBy(2)
        }
        
        loadBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.top.bottom.equalToSuperview()
            make.leading.equalTo(saveBtn.snp.trailing)
        }
        
        let drawView = DrawView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height / 4, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2))
        drawView.backgroundColor = .white
        self.drawView = drawView
        
        let colorsView = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height * 0.75, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4))
        
        let purpleBtn = UIButton()
        purpleBtn.backgroundColor = .purple
        colorsView.addSubview(purpleBtn)
        purpleBtn.addTarget(self, action: #selector(selectPurple), for: .touchUpInside)
        
        let redBtn = UIButton()
        redBtn.backgroundColor = .red
        colorsView.addSubview(redBtn)
        redBtn.addTarget(self, action: #selector(selectRed), for: .touchUpInside)
        
        purpleBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().dividedBy(2)
        }
        
        redBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.top.bottom.equalToSuperview()
            make.leading.equalTo(purpleBtn.snp.trailing)
        }
        
        self.view.addSubview(actionsView)
        self.view.addSubview(drawView)
        self.view.addSubview(colorsView)
    }
    
    @objc private func save() {
        stateCarrier.saveLine()
    }
    
    @objc private func load() {
        stateCarrier.loadLine()
        stateCarrier.linesManager.printLines(in: drawView)
    }
    
    @objc private func selectPurple() {
        self.drawView.lineColor = .purple
    }
    
    @objc private func selectRed() {
        self.drawView.lineColor = .red
    }
}
