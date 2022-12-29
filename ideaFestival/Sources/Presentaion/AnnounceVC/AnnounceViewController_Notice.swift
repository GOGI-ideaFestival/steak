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
        ...\n
        안녕하세요 !!!! \n
        gogi를 만들었습니다! \n
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
