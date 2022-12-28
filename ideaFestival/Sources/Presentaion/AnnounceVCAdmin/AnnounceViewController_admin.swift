import UIKit
import SnapKit
import Then

final class AnnounceViewController_admin: BaseViewController {
    
    private let noticeUILabel = UILabel().then {
        $0.text = "N o t i c e"
        $0.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        $0.font = UIFont(name: "Adelle-Bold", size: 40)
    }
    
    private let Button1UIButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitle("Gogi", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize.zero
        $0.addTarget(self, action: #selector(gotoNextStep), for: .touchUpInside)
    }
    
    private let Button2UIButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitle("입니다", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize.zero
        $0.addTarget(self, action: #selector(gotoNextStep), for: .touchUpInside)
    }
    
    private let Button3UIButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitle("하하하", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize.zero
        $0.addTarget(self, action: #selector(gotoNextStep), for: .touchUpInside)
    }
    
    private let Button4UIButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitle("ㅇㄹㅇㄹㅇㄹ", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize.zero
        $0.addTarget(self, action: #selector(gotoNextStep), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubviews(
            noticeUILabel,
            Button1UIButton,
            Button2UIButton,
            Button3UIButton,
            Button4UIButton
        )
    }
    
    override func setLayout() {
        self.Button1UIButton.snp.makeConstraints {
            $0.top.equalTo (self.view).offset(231)
            $0.leading.equalTo(self.view).offset(26)
            $0.width.equalTo(337)
            $0.height.equalTo(88)
        }
        
        self.Button2UIButton.snp.makeConstraints {
            $0.top.equalTo (self.view).offset(367)
            $0.leading.equalTo(self.view).offset(26)
            $0.width.equalTo(337)
            $0.height.equalTo(88)
        }
        
        self.Button3UIButton.snp.makeConstraints {
            $0.top.equalTo (self.view).offset(503)
            $0.leading.equalTo(self.view).offset(26)
            $0.width.equalTo(337)
            $0.height.equalTo(88)
        }
        
        self.Button4UIButton.snp.makeConstraints {
            $0.top.equalTo (self.view).offset(639)
            $0.leading.equalTo(self.view).offset(26)
            $0.width.equalTo(337)
            $0.height.equalTo(88)
        }
        
        self.noticeUILabel.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(115)
            $0.leading.equalTo(self.view).offset(57)
            $0.width.equalTo(180)
            $0.height.equalTo(100)
        }
    }
    
    @objc
    private func gotoNextStep() {
        let controller = AnnounceViewController_Notice_admin()
        navigationController?.pushViewController(controller, animated: true)
    }
}
