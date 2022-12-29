import UIKit
import SnapKit
import Then

final class AnnounceViewController: BaseViewController {
    
    private let backUIBarButtonItem = UIBarButtonItem()
    
    private let noticeTitleUILabel = UILabel().then {
        $0.text = "N o t i c e"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        $0.font = UIFont(name: "Adelle-Bold", size: 27)
    }
    
    private let notice1UIButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitle("Gogi", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Adelle-Bold", size: 20)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize.zero
        $0.addTarget(self, action: #selector(goToNextStep), for: .touchUpInside)
    }
    
    private let notice2UIButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitle("222", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Adelle-Bold", size: 20)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize.zero
        $0.addTarget(self, action: #selector(goToNextStep), for: .touchUpInside)
    }
    
    private let notice3UIButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitle("333", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Adelle-Bold", size: 20)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize.zero
        $0.addTarget(self, action: #selector(goToNextStep), for: .touchUpInside)
    }
    
    private let notice4UIButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitle("4444", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Adelle-Bold", size: 20)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize.zero
        $0.addTarget(self, action: #selector(goToNextStep), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = backUIBarButtonItem
        backUIBarButtonItem.tintColor = UIColor(rgb: 0x000000)
    }
    
    override func addView() {
        view.addSubviews(
            noticeTitleUILabel,
            notice1UIButton,
            notice2UIButton,
            notice3UIButton,
            notice4UIButton
        )
    }
    
    override func setLayout() {
        self.noticeTitleUILabel.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(91)
            $0.leading.equalTo(self.view).offset(50)
        }
        self.notice1UIButton.snp.makeConstraints {
            $0.top.equalTo (self.view).offset(231)
            $0.leading.trailing.equalTo(self.view).inset(26)
            $0.height.equalTo(77)
        }
        
        self.notice2UIButton.snp.makeConstraints {
            $0.top.equalTo (self.notice1UIButton.snp.bottom).offset(59)
            $0.leading.trailing.equalTo(self.view).inset(26)
            $0.height.equalTo(77)
        }
        
        self.notice3UIButton.snp.makeConstraints {
            $0.top.equalTo (self.notice2UIButton.snp.bottom).offset(59)
            $0.leading.trailing.equalTo(self.view).inset(26)
            $0.height.equalTo(77)
        }
        
        self.notice4UIButton.snp.makeConstraints {
            $0.top.equalTo (self.notice3UIButton.snp.bottom).offset(59)
            $0.leading.trailing.equalTo(self.view).inset(26)
            $0.height.equalTo(77)
        }
    }
    
    @objc private func goToNextStep() {
        let controller = AnnounceViewController_Notice()
        navigationController?.pushViewController(controller, animated: true)
    }
}
