import SnapKit
import UIKit
import Then

class SignupViewController: BaseViewController{

    private let backUIBarButtonItem = UIBarButtonItem()
    
    private let emailUITextField = UITextField().then{
        $0.becomeFirstResponder()
        $0.layer.cornerRadius = 25
        $0.placeholder = "이메일"
        $0.font = UIFont(name: "JainiPurva-Regular", size: 15)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.backgroundColor = UIColor(rgb: 0xDAD1C6)
    }
    
    private let pwdUITextField = UITextField().then{
        $0.layer.cornerRadius = 25
        $0.placeholder = "비밀번호"
        $0.font = UIFont(name: "JainiPurva-Regular", size: 15)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.backgroundColor = UIColor(rgb: 0xDAD1C6)
        $0.isSecureTextEntry = true
    }
    
    private let pwdCheckUITextField = UITextField().then{
        $0.layer.cornerRadius = 25
        $0.placeholder = "비밀번호 확인"
        $0.font = UIFont(name: "JainiPurva-Regular", size: 15)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.backgroundColor = UIColor(rgb: 0xDAD1C6)
        $0.isSecureTextEntry = true
    }
    
    private let nicknameUITextField = UITextField().then{
        $0.layer.cornerRadius = 25
        $0.placeholder = "닉네임"
        $0.font = UIFont(name: "JainiPurva-Regular", size: 15)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.backgroundColor = UIColor(rgb: 0xDAD1C6)
    }
    
    private let selectPositionUIButton = UIButton().then{
        $0.setTitle("역할 선택하기", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.addTarget(self, action: #selector(goSelect), for: .touchUpInside)
        $0.titleLabel?.font = UIFont(name: "JainiPurva-Regular", size: 15)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = backUIBarButtonItem
        backUIBarButtonItem.tintColor = UIColor(rgb: 0x000000)
    }

       override func addView(){
           view.addSubviews(
           emailUITextField,
           pwdUITextField,
           pwdCheckUITextField,
           nicknameUITextField,
           selectPositionUIButton
           )
       }
    
    override func setLayout(){
        self.emailUITextField.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(305)
            $0.leading.trailing.equalTo(self.view).inset(29)
            $0.height.equalTo(53)
        }
        self.pwdUITextField.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(371)
            $0.leading.trailing.equalTo(self.view).inset(29)
            $0.height.equalTo(53)
        }
        self.pwdCheckUITextField.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(437)
            $0.leading.trailing.equalTo(self.view).inset(29)
            $0.height.equalTo(53)
        }
        self.nicknameUITextField.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(503)
            $0.leading.trailing.equalTo(self.view).inset(29)
            $0.height.equalTo(53)
        }
        self.selectPositionUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(584)
            $0.leading.trailing.equalTo(self.view).inset(29)
        }
    }
    
    
    @objc private func goSelect(){
        self.TFdidChanged()
        if emailFormatCheck() == false{
            self.wrongEmailAlert()
        }
        self.pwdFormatCheck()
        let controller = ChoiceViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.emailUITextField.resignFirstResponder()
    }
    
    func isSameBothTextField(_ first: UITextField,_ second: UITextField) -> Bool {
        if(first.text == second.text) {
            return true
        } else {
            return false
        }
    }
    
    @objc func TFdidChanged(){
        if (self.emailUITextField.text?.isEmpty ?? true) || (self.pwdUITextField.text?.isEmpty ?? true) || (self.pwdCheckUITextField.text?.isEmpty ?? true) || (self.nicknameUITextField.text?.isEmpty ?? true) {
            self.emptyField()
        }
        else if !(isSameBothTextField(pwdUITextField, pwdCheckUITextField)){
            self.notSamePwd()
        }
    }
    
    @objc private func emptyField(){
        let completed = UIAlertController(title: "입력되지않은 칸이 있습니다", message: "빈 칸이 없도록 기입해주세요", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    @objc private func notSamePwd(){
        let completed = UIAlertController(title: "비밀번호가 일치하지 않습니다", message: "비밀번호 확인란을 다시 기입해주세요", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    func emailFormatCheck() -> Bool{
        var id = emailUITextField.text ?? ""
        if id.count == 16{
            let firstIdIndex = id.index(id.startIndex, offsetBy: 6)
            let lastIdIndex = id.index(id.startIndex, offsetBy: 16)
            let mail = id[firstIdIndex..<lastIdIndex]
            if mail == "@gsm.hs.kr"{
                return true
            }
            else {
                return false
            }
        }
        else{
            return false
        }
    }
    
    @objc private func wrongEmailAlert(){
        let completed = UIAlertController(title: "이메일 형식이 올바르지 않습니다", message: "다시 입력해주세요", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    func pwdFormatCheck(){
        var pwd = pwdUITextField.text ?? ""
        if pwd.count < 6{
            wrongPwdAlert()
        }
    }
    
    @objc private func wrongPwdAlert(){
        let completed = UIAlertController(title: "비밀번호는 6자 이상으로 설정해 주세요", message: nil, preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    func nicknameFormatCheck(){
        var nickname = nicknameUITextField.text ?? ""
        if nickname.count > 6{
            wrongNicknameAlert()
        }
    }
    
    @objc private func wrongNicknameAlert(){
        let completed = UIAlertController(title: "닉네임은 6자 이하로 설정해 주세요", message: nil, preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
}
