import UIKit
import SnapKit
import Then

class ModifyViewController: BaseViewController{
    
    let imagePickerController = UIImagePickerController()
    
    public let profileImageView = UIImageView().then {
        $0.backgroundColor = UIColor(rgb: 0xD9D9D9)
        $0.layer.cornerRadius = 0.5 * 137
        $0.clipsToBounds = true
    }
    
    private let cameraSFsymbolImageView = UIImageView().then {
        $0.image = UIImage(systemName: "camera")
        $0.tintColor = .systemGray2
    }
    
    private let changeProfileButton = UIButton().then {
        $0.setTitle("change profile", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xAFAFAF), for: .normal)
        $0.titleLabel?.font = UIFont(name: "JainiPurva", size: 13)
        $0.addTarget(self, action: #selector(changeProfileImageView), for: .touchUpInside)
    }
    
    private let explainNicknameLabel = UILabel().then {
        $0.text = "닉네임"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .ideaFestival(size: 17, family: .regular)
    }
    
    private let changeNicknameTextField = UITextField().then{
        $0.borderStyle = .none
        $0.textColor = UIColor(rgb: 0x000000)
        $0.backgroundColor = UIColor(rgb: 0xEFEFEF)
        $0.layer.cornerRadius = 20
        $0.font = .ideaFestival(size: 15, family: .regular)
        $0.textAlignment = .center
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(goToPop))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(rgb: 0x6A6868)
    }
    
    override func addView() {
        view.addSubviews(
            profileImageView,
            cameraSFsymbolImageView,
            changeProfileButton,
            explainNicknameLabel,
            changeNicknameTextField
        )
    }
    
    override func setLayout() {
        self.profileImageView.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(123)
            $0.centerX.equalTo(self.view)
            $0.height.equalTo(137)
            $0.width.equalTo(137)
        }
        self.cameraSFsymbolImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.changeProfileButton.snp.centerY)
            $0.leading.equalTo(self.view).offset(143)
            $0.width.equalTo(16)
            $0.height.equalTo(12)
        }
        self.changeProfileButton.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(283)
            $0.leading.equalTo(self.cameraSFsymbolImageView.snp.trailing).offset(2)
        }
        self.explainNicknameLabel.snp.makeConstraints {
            $0.top.equalTo(self.changeProfileButton.snp.bottom).offset(53)
            $0.leading.equalTo(self.view).offset(44)
        }
        self.changeNicknameTextField.snp.makeConstraints {
            $0.top.equalTo(self.explainNicknameLabel.snp.bottom).offset(8)
            $0.centerX.equalTo(self.view)
            $0.leading.trailing.equalTo(self.view).inset(29)
            $0.height.equalTo(53)
        }
    }
    
    @objc private func changeProfileImageView(_ sender: UIButton) {
        self.imagePickerController.delegate = self
        self.imagePickerController.sourceType = .photoLibrary
        present(self.imagePickerController, animated: true, completion: nil)
    }
    
    @objc private func textFieldDidChange(_ sender: Any?) {
        if changeNicknameTextField.text?.count ?? 0 > 6 {
            changeNicknameTextField.text = ""
            let alert = UIAlertController(title: "6자 이하로 설정해주세요", message: nil, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
        }
    }
    
    @objc private func goToPop(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension ModifyViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
