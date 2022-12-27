import UIKit
import SnapKit
import Then

class ProfileViewController: BaseViewController {
  
    private let backBarButtonItem = UIBarButtonItem()
    
    private let profileImageView = UIImageView().then {
        $0.backgroundColor = UIColor(rgb: 0xD9D9D9)
        $0.layer.cornerRadius = 0.5 * 137
    }
    
    private let explainNicknameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .ideaFestival(size: 17, family: .regular)
    }
    
    private let nicknameLabel = UILabel().then {
        $0.text = "박준서"
        $0.textColor = UIColor(rgb: 0x575757)
        $0.font = .ideaFestival(size: 16, family: .regular)
        $0.numberOfLines = 1
    }
    
    private let explainEmailLabel = UILabel().then {
        $0.text = "이메일 주소"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .ideaFestival(size: 17, family: .regular)
    }
    
    private let emailLabel = UILabel().then {
        $0.text = "s22023@gsm.hs.kr"
        $0.textColor = UIColor(rgb: 0x575757)
        $0.font = .ideaFestival(size: 16, family: .regular)
        $0.numberOfLines = 1
    }
    
    private let underLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 163/255, green: 146/255, blue: 136/255, alpha: 0.56)
    }
    
    private let mypenaltyLabel = UILabel().then {
        $0.text = "나의 패널티"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .ideaFestival(size: 15, family: .regular)
    }

    private let mypenaltyImageView = UIImageView().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 20
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 6
    }

    private let penaltyMessageLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "패널티가 없어요! \n규칙을 잘 지켜주셨군요 😇"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .ideaFestival(size: 14, family: .regular)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backBarButtonItem.tintColor = UIColor(rgb: 0x000000)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(goToModify))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(rgb: 0x6A6868)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    override func addView() {
        view.addSubviews(
        profileImageView,
        explainNicknameLabel,
        nicknameLabel,
        explainEmailLabel,
        emailLabel,
        underLineView,
        mypenaltyLabel,
        mypenaltyImageView,
        penaltyMessageLabel
        )
    }
    
    override func setLayout() {
        self.profileImageView.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(110)
            $0.centerX.equalTo(self.view)
            $0.height.equalTo(137)
            $0.width.equalTo(137)
        }
        self.explainNicknameLabel.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(325)
            $0.leading.equalTo(self.view).offset(46)
        }
        self.nicknameLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.explainNicknameLabel.snp.centerY)
            $0.trailing.equalTo(self.view).inset(47)
        }
        self.explainEmailLabel.snp.makeConstraints {
            $0.top.equalTo(self.explainNicknameLabel.snp.bottom).offset(24)
            $0.leading.equalTo(self.explainNicknameLabel.snp.leading).offset(-2)
        }
        self.emailLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.explainEmailLabel.snp.centerY)
            $0.trailing.equalTo(self.view).inset(46)
        }
        self.underLineView.snp.makeConstraints {
            $0.top.equalTo(self.explainEmailLabel.snp.bottom).offset(33)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(4)
        }
        self.mypenaltyLabel.snp.makeConstraints {
            $0.top.equalTo(self.underLineView.snp.bottom).offset(37)
            $0.leading.equalTo(self.view).offset(34)
        }
        self.mypenaltyImageView.snp.makeConstraints {
            $0.top.equalTo(self.mypenaltyLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(self.view)
            $0.leading.trailing.equalTo(self.view).inset(38)
            $0.height.equalTo(219)
        }
        self.penaltyMessageLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.mypenaltyImageView.snp.centerX)
            $0.centerY.equalTo(self.mypenaltyImageView.snp.centerY)
        }
    }
    
    @objc private func goToModify(_ sender: UIButton) {
        let vc = ModifyViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
