import UIKit
import Then
import SnapKit

final class AnnounceViewController_admin: UIViewController {

    private let Button1 = UIButton().then {
//        $0.setTitle("Gogi", for: .normal)
        $0.backgroundColor = .white
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(notice1), for: .touchUpInside)
    }
    
    private let Button2 = UIButton().then {
//        $0.setTitle("Gogi", for: .normal)
        $0.backgroundColor = .white
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(notice2), for: .touchUpInside)
        
    }
    
    private let Button3 = UIButton().then {
//        $0.setTitle("Goi", for: .normal)
        $0.backgroundColor = .white
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(notice3), for: .touchUpInside)
    }
    
    private let Button4 = UIButton().then {
//        $0.setTitle("Gogi", for: .normal)
        $0.backgroundColor = .white
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(notice4), for: .touchUpInside)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubView()
        setUpView()
    }
    
    @objc
    private func notice1() {
        let controller = AnnounceViewController_Notice_1_admin()
        navigationController?.pushViewController(controller, animated: true)
        //navigationItem.title = "공지"
    }
    
    @objc
    private func notice2() {
        let controller = AnnounceViewController_Notice_2_admin()
        navigationController?.pushViewController(controller, animated: true)
        //navigationItem.title = "공지"
    }
    
    @objc
    private func notice3() {
        let controller = AnnounceViewController_Notice_3_admin()
        navigationController?.pushViewController(controller, animated: true)
        //navigationItem.title = "공지"
    }
    
    @objc
    private func notice4() {
        let controller = AnnounceViewController_Notice_4_admin()
        navigationController?.pushViewController(controller, animated: true)
        //navigationItem.title = "공지"
    }
    
    private func setUI() {
        view.backgroundColor = .white
        addView()
    }
    
    func setUpView() {
        self.Button1.snp.makeConstraints {
            $0.top.equalTo (self.view).offset(231)
            $0.left.equalTo(self.view).offset(26)
            $0.width.equalTo(337)
            $0.height.equalTo(88)
        }
        
        self.Button2.snp.makeConstraints {
            $0.top.equalTo (self.view).offset(367)
            $0.left.equalTo(self.view).offset(26)
            $0.width.equalTo(337)
            $0.height.equalTo(88)
        }
        
        self.Button3.snp.makeConstraints {
            $0.top.equalTo (self.view).offset(503)
            $0.left.equalTo(self.view).offset(26)
            $0.width.equalTo(337)
            $0.height.equalTo(88)
        }
        
        self.Button4.snp.makeConstraints {
            $0.top.equalTo (self.view).offset(639)
            $0.left.equalTo(self.view).offset(26)
            $0.width.equalTo(337)
            $0.height.equalTo(88)
        }
    }
    
    private func addSubView() {
        view.addSubview(Button1)
        view.addSubview(Button2)
        view.addSubview(Button3)
        view.addSubview(Button4)
    }
    
    func addView() {

        let notice = UILabel()
        notice.text = "N O T I C E"
        view.addSubview(notice)
        notice.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        notice.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50).isActive = true
        notice.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        notice.font = notice.font.withSize(30)
        notice.textColor = UIColor .gray
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
