import UIKit

class AnnounceViewController_Notice_admin: BaseViewController {
    
    private let notice1UIButton = UIButton().then{
        $0.setTitle("안녕하세요 :)", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x000000), for: .normal)
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.cornerRadius = 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notice = UILabel()
        notice.text = "Gogi"
        view.addSubview(notice)
        notice.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        notice.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50).isActive = true
        notice.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        notice.font = notice.font.withSize(30)
        notice.textColor = UIColor .black
        addSubView()
        setUpView()
    }
    
    func setUpView() {
        self.notice1UIButton.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(202)
            $0.leading.equalTo(self.view).offset(27)
            $0.width.equalTo(337)
            $0.height.equalTo(500)
        }
    }
    
    private func addSubView() {
        view.addSubview(notice1UIButton)
    }
}
