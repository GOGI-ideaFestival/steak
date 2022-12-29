import UIKit
import CoreData
import SnapKit
import Then

class ProfileViewController: BaseViewController {
    
    private var profileImage: UIImage?
    
    private let leftBackUIBarButtonItem = UIBarButtonItem()
    private let rightBackUIBarButtonItem = UIBarButtonItem()
    
    private let profileUIImageView = UIImageView().then {
        $0.backgroundColor = UIColor(rgb: 0xD9D9D9)
        $0.layer.cornerRadius = 0.5 * 137
        $0.clipsToBounds = true
    }
    
    private let explainNicknameUILabel = UILabel().then {
        $0.text = "닉네임"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .ideaFestival(size: 17, family: .regular)
    }
    
    private let nicknameUILabel = UILabel().then {
        $0.textColor = UIColor(rgb: 0x575757)
        $0.font = .ideaFestival(size: 16, family: .regular)
        $0.numberOfLines = 1
    }
    
    private let explainEmailUILabel = UILabel().then {
        $0.text = "이메일 주소"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .ideaFestival(size: 17, family: .regular)
    }
    
    private let emailUILabel = UILabel().then {
        $0.text = "s220xx@gsm.hs.kr"
        $0.textColor = UIColor(rgb: 0x575757)
        $0.font = .ideaFestival(size: 16, family: .regular)
        $0.numberOfLines = 1
    }
    
    private let underLineUIView = UIView().then {
        $0.backgroundColor = UIColor(red: 163/255, green: 146/255, blue: 136/255, alpha: 0.56)
    }
    
    private let mypenaltyUILabel = UILabel().then {
        $0.text = "나의 패널티"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .ideaFestival(size: 15, family: .regular)
    }
    
    private let mypenaltyUIImageView = UIImageView().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 20
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 6
    }
    
    private let penaltyMessageUILabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "패널티가 없어요! \n규칙을 잘 지켜주셨군요 😇"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .ideaFestival(size: 14, family: .regular)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightBackUIBarButtonItem.tintColor = UIColor(rgb: 0x000000)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(goToModify))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(rgb: 0x6A6868)
        leftBackUIBarButtonItem.tintColor = UIColor(rgb: 0x000000)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(goToModify))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(rgb: 0x6A6868)
        self.navigationItem.backBarButtonItem = rightBackUIBarButtonItem
        self.navigationItem.backBarButtonItem = leftBackUIBarButtonItem
    }
   
    override func viewWillAppear(_ animated: Bool) {
        fetchContact()
        profileUIImageView.image = profileImage
        let nickname: String = UserDefaults.standard.string(forKey: "nickname") ?? "익명"
        nicknameUILabel.text = nickname
    }
    
    override func addView() {
        view.addSubviews(
            profileUIImageView,
            explainNicknameUILabel,
            nicknameUILabel,
            explainEmailUILabel,
            emailUILabel,
            underLineUIView,
            mypenaltyUILabel,
            mypenaltyUIImageView,
            penaltyMessageUILabel
        )
    }
    
    override func setLayout() {
        self.profileUIImageView.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(110)
            $0.centerX.equalTo(self.view)
            $0.height.equalTo(137)
            $0.width.equalTo(137)
        }
        self.explainNicknameUILabel.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(325)
            $0.leading.equalTo(self.view).offset(46)
        }
        self.nicknameUILabel.snp.makeConstraints {
            $0.centerY.equalTo(self.explainNicknameUILabel.snp.centerY)
            $0.trailing.equalTo(self.view).inset(47)
        }
        self.explainEmailUILabel.snp.makeConstraints {
            $0.top.equalTo(self.explainNicknameUILabel.snp.bottom).offset(24)
            $0.leading.equalTo(self.explainNicknameUILabel.snp.leading).offset(-2)
        }
        self.emailUILabel.snp.makeConstraints {
            $0.centerY.equalTo(self.explainEmailUILabel.snp.centerY)
            $0.trailing.equalTo(self.view).inset(46)
        }
        self.underLineUIView.snp.makeConstraints {
            $0.top.equalTo(self.explainEmailUILabel.snp.bottom).offset(33)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(4)
        }
        self.mypenaltyUILabel.snp.makeConstraints {
            $0.top.equalTo(self.underLineUIView.snp.bottom).offset(37)
            $0.leading.equalTo(self.view).offset(34)
        }
        self.mypenaltyUIImageView.snp.makeConstraints {
            $0.top.equalTo(self.mypenaltyUILabel.snp.bottom).offset(20)
            $0.centerX.equalTo(self.view)
            $0.leading.trailing.equalTo(self.view).inset(38)
            $0.height.equalTo(219)
        }
        self.penaltyMessageUILabel.snp.makeConstraints {
            $0.centerX.equalTo(self.mypenaltyUIImageView.snp.centerX)
            $0.centerY.equalTo(self.mypenaltyUIImageView.snp.centerY)
        }
    }
    
    func fetchContact() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do {
          let result = try context.fetch(fetchRequest)
          for data in result as! [NSManagedObject] {
            let aaa = (data.value(forKey: "profileImage") as! Data)
            profileImage = UIImage(data: aaa)
          }
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    @objc private func goToModify(_ sender: UIButton) {
        let vc = ModifyViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
