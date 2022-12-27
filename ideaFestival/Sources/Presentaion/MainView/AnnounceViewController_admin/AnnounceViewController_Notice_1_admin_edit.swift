import UIKit
import SnapKit
import Then

class AnnounceViewController_Notice_1_admin_edit: UIViewController {
    
    let noticeEdit = UITextField().then {
        $0.backgroundColor = .white
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubView()
        setUpView()
    }
    
    func setUpView() {
        self.noticeEdit.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(202)
            $0.left.equalTo(self.view).offset(27)
            $0.width.equalTo(337)
            $0.height.equalTo(500)
        }
    }
    
    private func addSubView() {
        view.addSubview(noticeEdit)
    }
}
