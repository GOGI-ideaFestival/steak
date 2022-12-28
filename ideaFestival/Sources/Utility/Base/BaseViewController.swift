import UIKit

class BaseViewController: UIViewController {
    // MARK: - Properties
    let bounds = UIScreen().bounds
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundIfNotSet()
        setup()
        addView()
        setLayout()
        bind()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        setLayoutSubviews()
    }
    // MARK: - Deinitalizer
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    // MARK: - Method
    private func setupBackgroundIfNotSet() {
        if self.view.backgroundColor == nil {
            self.view.backgroundColor = UIColor(rgb: 0xF5F5F5)
        }
    }
    
    func setup() {}
    func addView() {}
    func setLayout() {}
    func setLayoutSubviews() {}
    
    func bind() {}
}

