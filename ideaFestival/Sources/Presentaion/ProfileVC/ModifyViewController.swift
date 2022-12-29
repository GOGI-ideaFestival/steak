import UIKit
import CoreData
import SnapKit
import Then

class ModifyViewController: BaseViewController{
    
    private var profileImage: UIImage?
    
    let UIimagePickerController = UIImagePickerController()
    
    public let profileUIImageView = UIImageView().then {
        $0.backgroundColor = UIColor(rgb: 0xD9D9D9)
        $0.layer.cornerRadius = 0.5 * 137
        $0.clipsToBounds = true
    }
    
    private let cameraSFsymbolUIImageView = UIImageView().then {
        $0.image = UIImage(systemName: "camera")
        $0.tintColor = .systemGray2
    }
    
    private let changeProfileUIButton = UIButton().then {
        $0.setTitle("change profile", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xAFAFAF), for: .normal)
        $0.titleLabel?.font = UIFont(name: "JainiPurva", size: 13)
        $0.addTarget(self, action: #selector(changeProfileUIImageView), for: .touchUpInside)
    }
    
    private let explainNicknameUILabel = UILabel().then {
        $0.text = "닉네임"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = .ideaFestival(size: 17, family: .regular)
    }
    
    private let changeNicknameUITextField = UITextField().then{
        $0.borderStyle = .none
        $0.textColor = UIColor(rgb: 0x000000)
        $0.backgroundColor = UIColor(rgb: 0xEFEFEF)
        $0.layer.cornerRadius = 20
        $0.font = UIFont(name: "JainiPurva-Regular", size: 15)
        $0.textAlignment = .center
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(goToChange))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(rgb: 0x6A6868)
        fetchContact()
        profileUIImageView.image = profileImage
    }
    
    override func addView() {
        view.addSubviews(
            profileUIImageView,
            cameraSFsymbolUIImageView,
            changeProfileUIButton,
            explainNicknameUILabel,
            changeNicknameUITextField
        )
    }
    
    override func setLayout() {
        self.profileUIImageView.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(123)
            $0.centerX.equalTo(self.view)
            $0.height.equalTo(137)
            $0.width.equalTo(137)
        }
        self.cameraSFsymbolUIImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.changeProfileUIButton.snp.centerY)
            $0.leading.equalTo(self.view).offset(143)
            $0.width.equalTo(16)
            $0.height.equalTo(12)
        }
        self.changeProfileUIButton.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(283)
            $0.leading.equalTo(self.cameraSFsymbolUIImageView.snp.trailing).offset(2)
        }
        self.explainNicknameUILabel.snp.makeConstraints {
            $0.top.equalTo(self.changeProfileUIButton.snp.bottom).offset(53)
            $0.leading.equalTo(self.view).offset(44)
        }
        self.changeNicknameUITextField.snp.makeConstraints {
            $0.top.equalTo(self.explainNicknameUILabel.snp.bottom).offset(8)
            $0.centerX.equalTo(self.view)
            $0.leading.trailing.equalTo(self.view).inset(29)
            $0.height.equalTo(53)
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
    
    @objc private func changeProfileUIImageView(_ sender: UIButton) {
        self.UIimagePickerController.delegate = self
        self.UIimagePickerController.sourceType = .photoLibrary
        present(self.UIimagePickerController, animated: true, completion: nil)
    }
    
    @objc private func textFieldDidChange(_ sender: Any?) {
        if changeNicknameUITextField.text?.count ?? 0 > 6 {
            changeNicknameUITextField.text = ""
            let alert = UIAlertController(title: "6자 이하로 설정해주세요", message: nil, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: false, completion: nil)
        }
    }
    
    @objc private func goToChange(_ sender: UIButton) {
        let save_nickname: String = changeNicknameUITextField.text ?? "익명"
        if save_nickname != "" {
            UserDefaults.standard.set(save_nickname, forKey: "nickname")
        }
        navigationController?.popViewController(animated: true)
    }
}

extension ModifyViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileUIImageView.image = image
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let jpegImageData = image.jpegData(compressionQuality: 1.0)
            //            let pngImageData  = image.pngData()
            let User =  NSEntityDescription.entity(forEntityName: "User", in: context)!
            let image = NSManagedObject(entity: User, insertInto: context)
            image.setValue(jpegImageData, forKeyPath: "profileImage")
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
