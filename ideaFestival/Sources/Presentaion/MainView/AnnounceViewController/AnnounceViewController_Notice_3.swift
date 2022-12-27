import UIKit
import Then
import SnapKit

class AnnounceViewController_Notice_3: UIViewController {
    
    private let Notice3 = UIButton().then {
        $0.setTitle("고기고기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.cornerRadius = 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notice = UILabel()
        notice.text = "입니다"
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
    
    func setUpView() {
        self.Notice3.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(202)
            $0.left.equalTo(self.view).offset(27)
            $0.width.equalTo(337)
            $0.height.equalTo(500)
        }
    }
    
    private func addSubView() {
        view.addSubview(Notice3)
    }
}