import UIKit
import SnapKit
import Then
import Firebase

final class LoginViewController: BaseViewController {
    
    let db = Firestore.firestore()
    var messages: [Message] = []
    private let backUIBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    private let emailUITextField = UITextField().then{
        $0.layer.cornerRadius = 25
        $0.placeholder = "이메일"
        $0.font = UIFont(name: "JainiPurva-Regular", size: 15)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.backgroundColor = UIColor(rgb: 0xDAD1C6)
        
    }
    
    lazy var accessoryView: UIView = {
        return accessoryView
    }()
    
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
    
    private let loginUIButton = UIButton().then{
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "JainiPurva-Regular", size: 15)
        $0.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    private let goToSignupUIButton = UIButton().then{
        $0.setTitle("회원가입하기", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "JainiPurva-Regular", size: 15)
        $0.addTarget(self, action: #selector(goToSignup), for: .touchUpInside)
    }
    
    private func emptyField(){
        let completed = UIAlertController(title: "입력되지않은 칸이 있습니다", message: "빈 칸이 없도록 기입해주세요", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    @objc private func goToMVC(){
        TFdidChanged()
        let vc = MainViewController()
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    @objc private func goToSignup(){
        let vc = SignupViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func TFdidChanged(){
        if (self.emailUITextField.text?.isEmpty ?? true) || (self.pwdUITextField.text?.isEmpty ?? true){
            emptyField()
        }
    }
    
    func wrongPassword(){
        let wrongPassword = UIAlertController(title: "비밀번호가 일치하지 않습니다", message: "비밀번호를 다시 입력해주세요", preferredStyle: .alert)
        wrongPassword.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(wrongPassword, animated: true, completion: nil)
    }
    
    
    override func addView() {
        view.addSubviews(
            emailUITextField,
            pwdUITextField,
            loginUIButton,
            goToSignupUIButton
        )
        hideKeyboardWhenTappedAround()
        self.navigationItem.backBarButtonItem = backUIBarButtonItem
        backUIBarButtonItem.tintColor = UIColor(rgb: 0xAB988E)
    }
    
    override func setLayout(){
        self.emailUITextField.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(313)
            $0.leading.trailing.equalTo(self.view).inset(29)
            $0.height.equalTo(53)
        }
        self.pwdUITextField.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(379)
            $0.leading.trailing.equalTo(self.view).inset(29)
            $0.height.equalTo(53)
        }
        self.loginUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(459)
            $0.leading.trailing.equalTo(self.view).inset(158.5)
        }
        self.goToSignupUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(756)
            $0.leading.trailing.equalTo(self.view).inset(150)
        }
    }
    
    @objc func login(_ sender: UIButton){
        
        guard let id = emailUITextField.text else{return}
        guard let ps = pwdUITextField.text else{return}
        TFdidChanged()
        
        Auth.auth().signIn(withEmail: id, password: ps){ authResult, error in
            if let error{
                self.wrongPassword()
            }else{
                self.goToMVC()
            }
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
