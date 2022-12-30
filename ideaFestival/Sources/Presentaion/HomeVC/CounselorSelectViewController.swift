import UIKit
import SnapKit
import Then

final class CounselorSelectViewController: BaseViewController{
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    private let firstCounselorExplain: String = "1205 김주은입니당"
    private let secondCounselorExplain: String = "1204 박준서입니당"
    private let thirdCounselorExplain: String = "1209 신아인입니당"
    private let fourthCounselorExplain: String = "1308 박건우입니당"
    
    private let firstCounselorSongRecommendation: String = "괜찮아요 - 비투비"
    private let secondCounselorSongRecommendation: String = "마치 - Love is a magic"
    private let thirdCounselorSongRecommendation: String = "슬퍼하지마 - 구원찬"
    private let fourthCounselorSongRecommendation: String = "자격지심 - 비오"
    
    private let firstCounselorSongRecommendationURL: String
    = "https://www.youtube.com/watch?v=SNpuKLfv1EE"
    private let secondCounselorSongRecommendationURL: String
    = "https://www.youtube.com/watch?v=l0fIwtyc1Wo"
    private let thirdCounselorSongRecommendationURL: String
    = "https://www.youtube.com/watch?v=BWRVkHg8Rjs"
    private let fourthCounselorSongRecommendationURL: String
    = "https://www.youtube.com/watch?v=__Ys6bXwRpM"
    
    private var firstCounselorSelectName: String = ""
    private var secondCounselorSelectName: String = ""
    private var thirdCounselorSelectName: String = ""
    private var fourthCounselorSelectName: String = ""
    
    private var firstCounselorSelectUIImage: UIImage?
    private var secondCounselorSelectUIImage: UIImage?
    private var thirdCounselorSelectUIImage: UIImage?
    private var fourthCounselorSelectUIImage: UIImage?
    
    private var counselorName: String = ""
    private var counselorUIImage: UIImage?
    private var songRecommendation: String = ""
    private var songRecommendationURL: String = ""
    
    private let firstRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.cornerRadius = 20
        $0.layer.shadowOffset = CGSize.zero
    }
    
    private let firstCounselerUIImageView = UIImageView().then{
        $0.image = UIImage(named: "Pororo")
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
    }
    
    private let firstCounselorUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x636363)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 17)
    }
    
    private let firstCounselorExplainUILabel = UILabel().then{
        $0.numberOfLines = 3
        $0.textColor = UIColor(rgb: 0x636363)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 13)
    }
    
    private let firstCounselorSelectUIButton = UIButton().then{
        $0.setTitle("S E L E C T", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 8)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(red: 94/255, green: 63/255, blue: 46/255, alpha: 0.57)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(firstCounselerSelectUIButtonDidTap), for: .touchUpInside)
    }
    
    private let secondRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.cornerRadius = 20
        $0.layer.shadowOffset = CGSize.zero
    }
    
    private let secondCounselerUIImageView = UIImageView().then{
        $0.image = UIImage(named: "Eddy")
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
    }
    
    private let secondCounselorUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x636363)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 17)
    }
    
    private let secondCounselorExplainUILabel = UILabel().then{
        $0.numberOfLines = 3
        $0.textColor = UIColor(rgb: 0x636363)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 13)
    }
    
    private let secondCounselorSelectUIButton = UIButton().then{
        $0.setTitle("S E L E C T", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 8)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(red: 94/255, green: 63/255, blue: 46/255, alpha: 0.57)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(secondCounselerSelectUIButtonDidTap), for: .touchUpInside)
    }
    
    private let thirdRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.cornerRadius = 20
        $0.layer.shadowOffset = CGSize.zero
    }
    
    private let thirdCounselerUIImageView = UIImageView().then{
        $0.image = UIImage(named: "Loopy")
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
    }
    
    private let thirdCounselorUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x636363)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 17)
    }
    
    private let thirdCounselorExplainUILabel = UILabel().then{
        $0.numberOfLines = 3
        $0.textColor = UIColor(rgb: 0x636363)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 13)
    }
    
    private let thirdCounselorSelectUIButton = UIButton().then{
        $0.setTitle("S E L E C T", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 8)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(red: 94/255, green: 63/255, blue: 46/255, alpha: 0.57)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(thirdCounselerSelectUIButtonDidTap), for: .touchUpInside)
    }
    
    private let fourthRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.cornerRadius = 20
        $0.layer.shadowOffset = CGSize.zero
    }
    
    private let fourthCounselerUIImageView = UIImageView().then{
        $0.image = UIImage(named: "Poby")
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
    }
    
    private let fourthCounselorUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x636363)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 17)
    }
    
    private let fourthCounselorExplainUILabel = UILabel().then{
        $0.numberOfLines = 3
        $0.textColor = UIColor(rgb: 0x636363)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 13)
    }
    
    private let fourthCounselorSelectUIButton = UIButton().then{
        $0.setTitle("S E L E C T", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 8)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(red: 94/255, green: 63/255, blue: 46/255, alpha: 0.57)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(fourthCounselerSelectUIButtonDidTap), for: .touchUpInside)
    }
    
    override func setup() {
        firstCounselorUILabel.text = firstCounselorSelectName
        secondCounselorUILabel.text = secondCounselorSelectName
        thirdCounselorUILabel.text = thirdCounselorSelectName
        fourthCounselorUILabel.text = fourthCounselorSelectName
        
        firstCounselorExplainUILabel.text = firstCounselorExplain
        secondCounselorExplainUILabel.text = secondCounselorExplain
        thirdCounselorExplainUILabel.text = thirdCounselorExplain
        fourthCounselorExplainUILabel.text = fourthCounselorExplain
    }
    
    override func addView() {
        view.addSubviews(
            firstRectangleUIView,
            firstCounselerUIImageView,
            firstCounselorUILabel,
            firstCounselorExplainUILabel,
            firstCounselorSelectUIButton,
            secondRectangleUIView,
            secondCounselerUIImageView,
            secondCounselorUILabel,
            secondCounselorExplainUILabel,
            secondCounselorSelectUIButton,
            thirdRectangleUIView,
            thirdCounselerUIImageView,
            thirdCounselorUILabel,
            thirdCounselorExplainUILabel,
            thirdCounselorSelectUIButton,
            fourthRectangleUIView,
            fourthCounselerUIImageView,
            fourthCounselorUILabel,
            fourthCounselorExplainUILabel,
            fourthCounselorSelectUIButton
        )
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0xAB988E)
    }
    
    init(firstCounselorSelectUIImage: UIImage?, secondCounselorSelectUIImage: UIImage?,
         thirdCounselorSelectUIImage: UIImage?, fourthCounselorSelectUIImage: UIImage?,
         firstCounselorSelectName: String, secondCounselorSelectName: String,
         thirdCounselorSelectName: String, fourthCounselorSelectName: String) {
        self.firstCounselorSelectUIImage = firstCounselorSelectUIImage
        self.secondCounselorSelectUIImage = secondCounselorSelectUIImage
        self.thirdCounselorSelectUIImage = thirdCounselorSelectUIImage
        self.fourthCounselorSelectUIImage = fourthCounselorSelectUIImage
        self.firstCounselorSelectName = firstCounselorSelectName
        self.secondCounselorSelectName = secondCounselorSelectName
        self.thirdCounselorSelectName = thirdCounselorSelectName
        self.fourthCounselorSelectName = fourthCounselorSelectName
        super.init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func firstCounselerSelectUIButtonDidTap(_ sender: UIButton){
        counselorName = firstCounselorSelectName
        counselorUIImage = firstCounselorSelectUIImage
        songRecommendation = firstCounselorSongRecommendation
        songRecommendationURL = firstCounselorSongRecommendationURL
        let vc = CounselorProfileViewController(counselor: counselorName, counselorUIImage:  counselorUIImage, songRecommendation: songRecommendation, songRecommendationURL: songRecommendationURL)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func secondCounselerSelectUIButtonDidTap(_ sender: UIButton){
        counselorName = secondCounselorSelectName
        counselorUIImage = secondCounselorSelectUIImage
        songRecommendation = secondCounselorSongRecommendation
        songRecommendationURL = secondCounselorSongRecommendationURL
        let vc = CounselorProfileViewController(counselor: counselorName, counselorUIImage:  counselorUIImage, songRecommendation: songRecommendation, songRecommendationURL: songRecommendationURL)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func thirdCounselerSelectUIButtonDidTap(_ sender: UIButton){
        counselorName = thirdCounselorSelectName
        counselorUIImage = thirdCounselorSelectUIImage
        songRecommendation = thirdCounselorSongRecommendation
        songRecommendationURL = thirdCounselorSongRecommendationURL
        let vc = CounselorProfileViewController(counselor: counselorName, counselorUIImage:  counselorUIImage, songRecommendation: songRecommendation, songRecommendationURL: songRecommendationURL)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func fourthCounselerSelectUIButtonDidTap(_ sender: UIButton){
        counselorName = fourthCounselorSelectName
        counselorUIImage = fourthCounselorSelectUIImage
        songRecommendation = fourthCounselorSongRecommendation
        songRecommendationURL = fourthCounselorSongRecommendationURL
        let vc = CounselorProfileViewController(counselor: counselorName, counselorUIImage:  counselorUIImage, songRecommendation: songRecommendation, songRecommendationURL: songRecommendationURL)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setLayout() {
        self.firstRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(139)
            $0.leading.trailing.equalTo(self.view).inset(22)
            $0.height.equalTo(124)
        }
        self.firstCounselerUIImageView.snp.makeConstraints{
            $0.size.equalTo(80)
            $0.top.equalTo(self.firstRectangleUIView.snp.top).offset(19)
            $0.leading.equalTo(self.firstRectangleUIView.snp.leading).offset(19)
        }
        self.firstCounselorUILabel.snp.makeConstraints{
            $0.top.equalTo(self.firstRectangleUIView.snp.top).offset(27)
            $0.leading.equalTo(self.firstRectangleUIView.snp.leading).inset(116)
        }
        self.firstCounselorExplainUILabel.snp.makeConstraints{
            $0.top.equalTo(self.firstCounselorUILabel.snp.bottom).offset(9)
            $0.leading.equalTo(self.firstCounselorUILabel.snp.leading).offset(-2)
        }
        self.firstCounselorSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.firstRectangleUIView.snp.top).offset(15)
            $0.trailing.equalTo(self.firstRectangleUIView.snp.trailing).inset(16)
            $0.width.equalTo(70)
            $0.height.equalTo(28)
        }
        self.secondRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(self.firstRectangleUIView.snp.bottom).offset(42)
            $0.leading.trailing.equalTo(self.view).inset(22)
            $0.height.equalTo(124)
        }
        self.secondCounselerUIImageView.snp.makeConstraints{
            $0.size.equalTo(80)
            $0.top.equalTo(self.secondRectangleUIView.snp.top).offset(19)
            $0.leading.equalTo(self.secondRectangleUIView.snp.leading).offset(19)
        }
        self.secondCounselorUILabel.snp.makeConstraints{
            $0.top.equalTo(self.secondRectangleUIView.snp.top).offset(27)
            $0.leading.equalTo(self.secondRectangleUIView.snp.leading).offset(116)
        }
        self.secondCounselorExplainUILabel.snp.makeConstraints{
            $0.top.equalTo(self.secondCounselorUILabel.snp.bottom).offset(9)
            $0.leading.equalTo(self.secondCounselorUILabel.snp.leading).offset(-2)
        }
        self.secondCounselorSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.secondRectangleUIView.snp.top).offset(15)
            $0.trailing.equalTo(self.secondRectangleUIView.snp.trailing).inset(16)
            $0.width.equalTo(70)
            $0.height.equalTo(28)
        }
        self.thirdRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(self.secondRectangleUIView.snp.bottom).offset(42)
            $0.leading.trailing.equalTo(self.view).inset(22)
            $0.height.equalTo(124)
        }
        self.thirdCounselerUIImageView.snp.makeConstraints{
            $0.size.equalTo(80)
            $0.top.equalTo(self.thirdRectangleUIView.snp.top).offset(19)
            $0.leading.equalTo(self.thirdRectangleUIView.snp.leading).offset(19)
        }
        self.thirdCounselorUILabel.snp.makeConstraints{
            $0.top.equalTo(self.thirdRectangleUIView.snp.top).offset(27)
            $0.leading.equalTo(self.thirdRectangleUIView.snp.leading).offset(116)
        }
        self.thirdCounselorExplainUILabel.snp.makeConstraints{
            $0.top.equalTo(self.thirdCounselorUILabel.snp.bottom).offset(9)
            $0.leading.equalTo(self.thirdCounselorUILabel.snp.leading).offset(-2)
        }
        self.thirdCounselorSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.thirdRectangleUIView.snp.top).offset(15)
            $0.trailing.equalTo(self.thirdRectangleUIView.snp.trailing).inset(16)
            $0.width.equalTo(70)
            $0.height.equalTo(28)
        }
        self.fourthRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(self.thirdRectangleUIView.snp.bottom).offset(42)
            $0.leading.trailing.equalTo(self.view).inset(22)
            $0.height.equalTo(124)
        }
        self.fourthCounselerUIImageView.snp.makeConstraints{
            $0.size.equalTo(80)
            $0.top.equalTo(self.fourthRectangleUIView.snp.top).offset(19)
            $0.leading.equalTo(self.fourthRectangleUIView.snp.leading).offset(19)
        }
        self.fourthCounselorUILabel.snp.makeConstraints{
            $0.top.equalTo(self.fourthRectangleUIView.snp.top).offset(27)
            $0.leading.equalTo(self.fourthRectangleUIView.snp.leading).offset(116)
        }
        self.fourthCounselorExplainUILabel.snp.makeConstraints{
            $0.top.equalTo(self.fourthCounselorUILabel.snp.bottom).offset(9)
            $0.leading.equalTo(self.fourthCounselorUILabel.snp.leading).offset(-2)
        }
        self.fourthCounselorSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.fourthRectangleUIView.snp.top).offset(15)
            $0.trailing.equalTo(self.fourthRectangleUIView.snp.trailing).inset(16)
            $0.width.equalTo(70)
            $0.height.equalTo(28)
        }
    }
}

