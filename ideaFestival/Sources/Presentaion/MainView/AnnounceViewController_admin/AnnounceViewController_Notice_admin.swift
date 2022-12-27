import UIKit
import Then
import SnapKit

class AnnounceViewController_Notice_admin: UIViewController {
    
    private let Notice: UIButton = {

        Notice.setTitle("안녕하세요 :)", for: .normal)
        Notice.backgroundColor = .white
        Notice.setTitleColor(.black, for: .normal)
        Notice.layer.shadowRadius = 6
        Notice.layer.shadowOpacity = 0.6
        Notice.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        Notice.layer.cornerRadius = 20
        
        return Notice
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tabBarController?.tabBar.isHidden = true
        
        let notice = UILabel()
        notice.text = "Gogi"
        view.addSubview(notice)
        notice.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        notice.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50).isActive = true
        notice.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        notice.font = notice.font.withSize(30)
        notice.textColor = UIColor .black
        
        view.addSubview(Notice)
    }
    
}
