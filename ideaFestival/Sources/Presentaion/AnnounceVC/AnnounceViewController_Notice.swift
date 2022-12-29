import UIKit

class AnnounceViewController_Notice: BaseViewController {
    
    private let noticeTitleUILabel = UILabel().then {
        $0.text = "Gogi"
        $0.font = UIFont(name: "Adelle-SemiBold", size: 27)
    }
    
    private let noticeContentsFrameUIView = UIView().then{
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.cornerRadius = 40
    }
    
    private let noticeContentsUILabel = UILabel().then {
        $0.text =
        """
        안녕하세요 \n
        GOGI 는 자신의 이름을 밝히지 않고 \n
        편하게 고민상담을 할 수 있는 앱 입니다. \n\n
        4명의 상담가들이 친구나 가족들에게 \n
        하지 못했던 이야기를 들어줄거에요. \n\n
        저희는 최선을 다해 \n
        여러분의 마음을 위로하고 \n
        최고의 해결 방안을 제시합니다. \n\n
        또한 완벽한 비밀을 보장합니다. \n
        걱정하지마시고 뭐든 털어놓으세요!
        """
        $0.textAlignment = .left
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        $0.textColor = UIColor(rgb: 0x000000)
        $0.numberOfLines = 0
    }
    
    override func addView() {
        view.addSubviews(
            noticeTitleUILabel,
            noticeContentsFrameUIView,
            noticeContentsUILabel
        )
    }
    
    override func setLayout() {
        self.noticeTitleUILabel.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(125)
            $0.leading.equalTo(self.view).offset(57)
        }
        self.noticeContentsFrameUIView.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(192)
            $0.leading.trailing.equalTo(self.view).inset(37)
            $0.height.equalTo(592)
        }
        self.noticeContentsUILabel.snp.makeConstraints {
            $0.top.equalTo(self.noticeContentsFrameUIView.snp.top).inset(48)
            $0.leading.trailing.equalTo(self.noticeContentsFrameUIView).inset(32)
        }
    }
}
