import UIKit
import SnapKit
import Then
import Firebase

final class SignupViewController: BaseViewController{
    
    let db = Firestore.firestore()
    var messages: [Message] = []
    private let backUIBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
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
        $0.titleLabel?.font = UIFont(name: "JainiPurva-Regular", size: 15)
        $0.addTarget(self, action: #selector(signup), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.emailUITextField.resignFirstResponder()
    }
    
    override func addView(){
        view.addSubviews(
            emailUITextField,
            pwdUITextField,
            pwdCheckUITextField,
            nicknameUITextField,
            selectPositionUIButton
        )
        hideKeyboardWhenTappedAround()
        self.navigationItem.backBarButtonItem = backUIBarButtonItem
        backUIBarButtonItem.tintColor = UIColor(rgb: 0xAB988E)
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
        TFdidChanged()
        if emailFormatCheck() == false{
            wrongEmailAlertMessage()
        }
        pwdFormatCheck()
    }
    
    @objc private func goToSelectView(){
        let controller = ChoiceViewController()
        self.navigationController?.setViewControllers([controller], animated: true)
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
            emptyFieldAlertMessage()
        }
        else if !(isSameBothTextField(pwdUITextField, pwdCheckUITextField)){
            notSamePasswordAlerMessage()
        }
    }
    
    
    func emailFormatCheck() -> Bool{
        let id = emailUITextField.text ?? ""
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
    
    func pwdFormatCheck(){
        let pwd = pwdUITextField.text ?? ""
        if pwd.count < 6{
            wrongPasswordAlertMessage()
        }
    }
    
    func nicknameFormatCheck(){
        let nickname = nicknameUITextField.text ?? ""
        if nickname.count > 6{
            wrongNicknameAlertMessage()
        }
    }
    @objc private func emptyFieldAlertMessage(){
        let completed = UIAlertController(title: "입력되지않은 칸이 있습니다", message: "빈 칸이 없도록 기입해주세요", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    @objc private func wrongEmailAlertMessage(){
        let completed = UIAlertController(title: "이메일 형식이 올바르지 않습니다", message: "다시 입력해주세요", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    @objc private func wrongPasswordAlertMessage(){
        let completed = UIAlertController(title: "비밀번호는 6자 이상으로 설정해 주세요", message: nil, preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    @objc private func notSamePasswordAlerMessage(){
        let completed = UIAlertController(title: "비밀번호가 일치하지 않습니다", message: "비밀번호 확인란을 다시 기입해주세요", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    @objc private func wrongNicknameAlertMessage(){
        let completed = UIAlertController(title: "닉네임은 6자 이하로 설정해 주세요", message: nil, preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    @objc func signup(_ sender: UIButton){
        
        guard let id = emailUITextField.text else{return}
        guard let ps = pwdUITextField.text else{return}
        goSelect()
        
        Auth.auth().createUser(withEmail: id, password: ps) { result, error in
            if let error{
                print(error)
                let completed = UIAlertController(title: "이미 존재하는 아이디입니다", message: nil, preferredStyle: .alert)
                completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
                })
                self.present(completed, animated: true, completion: nil)
            }else{
                self.sendNickname()
                self.goToSelectView()
                
            }
        }
    }
    
    func sendNickname(){
        if let nickname = nicknameUITextField.text,
            let user = Auth.auth().currentUser?.email
        {
            db.collection("Steak2").document(user).setData(["nickname" : nickname])
        }
    }
}

