import UIKit
import SnapKit
import Then

final class AnnounceViewController: BaseViewController {
    
    private let notice = UILabel().then {
        $0.text = "N O T I C E"
        $0.textColor = .gray
        $0.font = $0.font.withSize(35)
    }
    
    private let Button1 = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("Gogi", for: .normal) // 목록 글끼
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        $0.addTarget(self, action: #selector(notice1), for: .touchUpInside)
    }
    
    private let Button2 = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("입니다", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        $0.addTarget(self, action: #selector(notice2), for: .touchUpInside)
    }
    
    private let Button3 = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("하하하", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        $0.addTarget(self, action: #selector(notice3), for: .touchUpInside)
    }
    
    private let Button4 = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitle("ㅇㄹㅇㄹㅇㄹ", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize(width: 0, height: 4) // 위치조정
        $0.addTarget(self, action: #selector(notice4), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setUpView()
    }
    
    @objc
    private func notice1() {
        let controller = AnnounceViewController_Notice_1()
        navigationController?.pushViewController(controller, animated: true)
        //navigationItem.title = "공지"
    }
    
    @objc
    private func notice2() {
        let controller = AnnounceViewController_Notice_2()
        navigationController?.pushViewController(controller, animated: true)
        //navigationItem.title = "공지"
    }
    
    @objc
    private func notice3() {
        let controller = AnnounceViewController_Notice_3()
        navigationController?.pushViewController(controller, animated: true)
        //navigationItem.title = "공지"
    }
    
    @objc
    private func notice4() {
        let controller = AnnounceViewController_Notice_4()
        navigationController?.pushViewController(controller, animated: true)
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
        
        self.notice.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(115)
            $0.left.equalTo(self.view).offset(57)
            $0.width.equalTo(180)
            $0.height.equalTo(100)
        }
    }
    
    private func addSubView() {
        view.addSubview(Button1)
        view.addSubview(Button2)
        view.addSubview(Button3)
        view.addSubview(Button4)
        view.addSubview(notice)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}
