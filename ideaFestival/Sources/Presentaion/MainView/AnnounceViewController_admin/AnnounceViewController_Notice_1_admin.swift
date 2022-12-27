import UIKit
import Then
import SnapKit

class AnnounceViewController_Notice_1_admin: UIViewController {
    
    private let edit = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("edit", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.addTarget(self, action: #selector(noticeEdit), for: .touchUpInside)
    }
    
    private let delete = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("delete", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private let Notice1_1 = UILabel().then {
        $0.text = "안녕하세요 :)"
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        $0.layer.cornerRadius = 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notice = UILabel()
        notice.text = "안녕하세요 :)"
        view.addSubview(notice)
        notice.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        notice.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50).isActive = true
        notice.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        notice.font = notice.font.withSize(30)
        notice.textColor = UIColor .black
        addSubView()
        setUpView()
    }
    
    @objc
    private func noticeEdit() {
        let controller = AnnounceViewController_Notice_1_admin_edit()
        navigationController?.pushViewController(controller, animated: true)
    }

    func setUpView() {
        self.Notice1_1.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(202)
            $0.left.equalTo(self.view).offset(27)
            $0.width.equalTo(337)
            $0.height.equalTo(500)
        }
        
        self.edit.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(670)
            $0.left.equalTo(self.view).offset(33)
            $0.width.equalTo(50)
            $0.height.equalTo(20)
        }
        
        self.delete.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(670)
            $0.left.equalTo(self.view).offset(280)
            $0.width.equalTo(80)
            $0.height.equalTo(20)
        }
    }
    
    private func addSubView() {
        view.addSubview(Notice1_1)
        view.addSubview(edit)
        view.addSubview(delete)
    }
}
