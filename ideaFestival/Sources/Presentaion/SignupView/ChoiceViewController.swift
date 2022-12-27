import UIKit
import SnapKit
import Then

class ChoiceViewController: BaseViewController{

    private func setUI(){
        view.backgroundColor = .white
        addView()
    }
    
    override func addView(){
        view.addSubviews(
        userSelectUIButton,
        ownerSelectUIButton,
        userUILabel,
        ownerUILabel
        )
    }
    
    private let userSelectUIButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 52
        $0.clipsToBounds = true
        $0.setImage(UIImage(systemName: "person.wave.2"), for: .normal)
        $0.addTarget(self, action: #selector(userCheckAlert), for: .touchUpInside)
        $0.layer.borderWidth = 0.3
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private let ownerSelectUIButton = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 52
        $0.clipsToBounds = true
        $0.setImage(UIImage(systemName: "person.badge.shield.checkmark"), for: .normal)
        $0.addTarget(self, action: #selector(ownerCheckAlert), for: .touchUpInside)
        $0.layer.borderWidth = 0.3
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private let userUILabel = UILabel().then {
        $0.text = "회원"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    
    private let ownerUILabel = UILabel().then {
        $0.text = "상담사"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15)
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
            self.navigationController?.pushViewController(controller, animated: true)
        })
        present(completed, animated: true, completion: nil)
    }
    
    override func setLayout(){
        self.userSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(368)
            $0.bottom.equalTo(self.view).inset(373)
            $0.leading.equalTo(self.view).inset(70)
            $0.trailing.equalTo(self.view).inset(217)
        }
        self.ownerSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(368)
            $0.bottom.equalTo(self.view).inset(373)
            $0.leading.equalTo(self.view).inset(217)
            $0.trailing.equalTo(self.view).inset(70)
        }
        self.userUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(489)
            $0.bottom.equalTo(self.view).inset(330)
            $0.leading.equalTo(self.view).inset(107)
            $0.trailing.equalTo(self.view).inset(253)
        }
        self.ownerUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(489)
            $0.bottom.equalTo(self.view).inset(330)
            $0.leading.equalTo(self.view).inset(244)
            $0.trailing.equalTo(self.view).inset(102)
        }
    }
}
