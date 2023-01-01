import UIKit
import SnapKit
import Then

final class ChoiceViewController: BaseViewController{

    private let userSelectUIButton = UIButton().then{
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 103 / 2
        $0.clipsToBounds = true
        $0.setImage(UIImage(systemName: "person.wave.2"), for: .normal)
        $0.tintColor = UIColor(rgb: 0x000000)
        $0.addTarget(self, action: #selector(userCheckAlert), for: .touchUpInside)
        $0.layer.borderWidth = 0.3
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private let ownerSelectUIButton = UIButton().then{
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 103 / 2
        $0.clipsToBounds = true
        $0.setImage(UIImage(systemName: "person.badge.shield.checkmark"), for: .normal)
        $0.tintColor = UIColor(rgb: 0x000000)
        $0.addTarget(self, action: #selector(ownerCheckAlert), for: .touchUpInside)
        $0.layer.borderWidth = 0.3
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private let userUILabel = UILabel().then {
        $0.text = "회원"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 15)
    }
    
    private let ownerUILabel = UILabel().then {
        $0.text = "상담사"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 15)
    }
    
    override func addView(){
        view.addSubviews(
        userSelectUIButton,
        ownerSelectUIButton,
        userUILabel,
        ownerUILabel
        )
    }
    
    override func setLayout(){
        self.userSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(368)
            $0.leading.equalTo(self.view).inset(70)
            $0.width.equalTo(103)
            $0.height.equalTo(103)
        }
        self.ownerSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(368)
            $0.leading.equalTo(self.view).inset(217)
            $0.width.equalTo(103)
            $0.height.equalTo(103)
        }
        self.userUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(489)
            $0.leading.equalTo(self.view).inset(107)
        }
        self.ownerUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(489)
            $0.leading.equalTo(self.view).inset(244)
        }
    }
    
    @objc private func userCheckAlert(){
        let userAlert = UIAlertController(title: "회원으로 가입하시겠습니까?", message: "닉네임을 제외한 정보는 변경할 수 없습니다.", preferredStyle: .alert)
        userAlert.addAction(UIAlertAction(title: "확인", style: .default){_ in
            self.completedSignupAlert()
        })
        userAlert.addAction(UIAlertAction(title: "취소", style: .cancel){_ in
        })
        present(userAlert, animated: true, completion: nil)
    }
    
    @objc private func ownerCheckAlert(){
        let ownerAlert = UIAlertController(title: "상담사로 가입하시겠습니까?", message: "닉네임을 제외한 정보는 변경할 수 없습니다.", preferredStyle: .alert)
        ownerAlert.addAction(UIAlertAction(title: "확인", style: .default){_ in
            self.completedSignupAlert()
        })
        ownerAlert.addAction(UIAlertAction(title: "취소", style: .cancel){_ in
        })
        present(ownerAlert, animated: true, completion: nil)
    }
    
    @objc private func completedSignupAlert(){
        let completed = UIAlertController(title: "가입이 완료되었습니다.", message: nil, preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
            let controller = LoginViewController()
            self.navigationController?.setViewControllers([controller], animated: true)
            
        })
        present(completed, animated: true, completion: nil)
    }
}
