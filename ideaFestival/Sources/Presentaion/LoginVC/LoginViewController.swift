import UIKit
import SnapKit
import Then

class LoginViewController: BaseViewController {

    private let backUIBarButtonItem = UIBarButtonItem()
    
    private let emailUITextField = UITextField().then{
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
    
    private let loginUIButton = UIButton().then{
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.addTarget(self, action: #selector(goToLogIn), for: .touchUpInside)
        $0.titleLabel?.font = UIFont(name: "JainiPurva-Regular", size: 15)
    }
    
    private let signupUIButton = UIButton().then{
        $0.setTitle("회원가입하기", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "JainiPurva-Regular", size: 15)
        $0.addTarget(self, action: #selector(goToSignUp), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = backUIBarButtonItem
        backUIBarButtonItem.tintColor = UIColor(rgb: 0x000000)
    }

    override func addView() {
        view.addSubviews(
            emailUITextField,
            pwdUITextField,
            loginUIButton,
            signupUIButton
        )
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
        self.signupUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(769)
            $0.leading.trailing.equalTo(self.view).inset(137.5)
        }
    }
    
    @objc func TFdidChanged(){
        if (self.emailUITextField.text?.isEmpty ?? true) || (self.pwdUITextField.text?.isEmpty ?? true){
            self.emptyField()
        }
    }
    
     private func emptyField(){
        let completed = UIAlertController(title: "입력되지않은 칸이 있습니다", message: "빈 칸이 없도록 기입해주세요", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "확인", style: .default){_ in
        })
        present(completed, animated: true, completion: nil)
    }
    
    @objc private func goToLogIn(_ sender: UIButton){
        self.TFdidChanged()
        let controller = HomeViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func goToSignUp(_ sender :UIButton){
        let controller = SignupViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
