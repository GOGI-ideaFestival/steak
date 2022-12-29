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
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let firstCounselerUIImageView = UIImageView().then{
        $0.image = UIImage(named: "Pororo")
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
    }
    
    private let firstCounselorUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 17, family: .light)
    }
    
    private let firstCounselorExplainUILabel = UILabel().then{
        $0.numberOfLines = 3
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 13, family: .light)
    }
    
    private let firstCounselorSelectUIButton = UIButton().then{
        $0.setTitle("SELECT", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 8, family: .semiBold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(firstCounselerSelectUIButtonDidTap), for: .touchUpInside)
    }
    
    private let secondRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let secondCounselerUIImageView = UIImageView().then{
        $0.image = UIImage(named: "Eddy")
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
    }
    
    private let secondCounselorUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 17, family: .light)
    }
    
    private let secondCounselorExplainUILabel = UILabel().then{
        $0.numberOfLines = 3
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 13, family: .light)
    }
    
    private let secondCounselorSelectUIButton = UIButton().then{
        $0.setTitle("SELECT", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 8, family: .semiBold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(secondCounselerSelectUIButtonDidTap), for: .touchUpInside)
    }
    
    private let thirdRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let thirdCounselerUIImageView = UIImageView().then{
        $0.image = UIImage(named: "Loopy")
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
    }
    
    private let thirdCounselorUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 17, family: .light)
    }
    
    private let thirdCounselorExplainUILabel = UILabel().then{
        $0.numberOfLines = 3
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 13, family: .light)
    }
    
    private let thirdCounselorSelectUIButton = UIButton().then{
        $0.setTitle("SELECT", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 8, family: .semiBold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(thirdCounselerSelectUIButtonDidTap), for: .touchUpInside)
    }
    
    private let fourthRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let fourthCounselerUIImageView = UIImageView().then{
        $0.image = UIImage(named: "Poby")
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
    }
    
    private let fourthCounselorUILabel = UILabel().then{
        $0.numberOfLines = 3
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 17, family: .light)
    }
    
    private let fourthCounselorExplainUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 13, family: .light)
    }
    
    private let fourthCounselorSelectUIButton = UIButton().then{
        $0.setTitle("SELECT", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 8, family: .semiBold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
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
            $0.bottom.equalTo(self.view).inset(581)
            $0.leading.trailing.equalTo(self.view).inset(22)
        }
        self.firstCounselerUIImageView.snp.makeConstraints{
            $0.size.equalTo(80)
            $0.top.equalTo(self.view).offset(158)
            $0.leading.equalTo(self.view).offset(41)
        }
        self.firstCounselorUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(162)
            $0.leading.equalTo(self.view).offset(136)
        }
        self.firstCounselorExplainUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(194)
            $0.leading.equalTo(self.view).offset(136)
            $0.trailing.equalTo(self.view).inset(85)
        }
        self.firstCounselorSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(151)
            $0.leading.equalTo(self.view).offset(282)
            $0.trailing.equalTo(self.view).inset(38)
        }
        self.secondRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(304)
            $0.bottom.equalTo(self.view).inset(416)
            $0.leading.trailing.equalTo(self.view).inset(22)
        }
        self.secondCounselerUIImageView.snp.makeConstraints{
            $0.size.equalTo(80)
            $0.top.equalTo(self.view).offset(326)
            $0.leading.equalTo(firstCounselerUIImageView.snp.leading)
        }
        self.secondCounselorUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(330)
            $0.leading.equalTo(firstCounselorUILabel.snp.leading)
        }
        self.secondCounselorExplainUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(362)
            $0.leading.equalTo(firstCounselorExplainUILabel.snp.leading)
            $0.trailing.equalTo(firstCounselorExplainUILabel.snp.trailing)
        }
        self.secondCounselorSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(319)
            $0.leading.equalTo(firstCounselorSelectUIButton.snp.leading)
            $0.trailing.equalTo(firstCounselorSelectUIButton.snp.trailing)
        }
        self.thirdRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(475)
            $0.bottom.equalTo(self.view).inset(245)
            $0.leading.trailing.equalTo(self.view).inset(22)
        }
        self.thirdCounselerUIImageView.snp.makeConstraints{
            $0.size.equalTo(80)
            $0.top.equalTo(self.view).offset(495)
            $0.leading.equalTo(firstCounselerUIImageView.snp.leading)
        }
        self.thirdCounselorUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(498)
            $0.leading.equalTo(firstCounselorUILabel.snp.leading)
        }
        self.thirdCounselorExplainUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(530)
            $0.leading.equalTo(firstCounselorExplainUILabel.snp.leading)
            $0.trailing.equalTo(firstCounselorExplainUILabel.snp.trailing)
        }
        self.thirdCounselorSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(487)
            $0.leading.equalTo(firstCounselorSelectUIButton.snp.leading)
            $0.trailing.equalTo(firstCounselorSelectUIButton.snp.trailing)
        }
        self.fourthRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(643)
            $0.bottom.equalTo(self.view).inset(77)
            $0.leading.trailing.equalTo(self.view).inset(22)
        }
        self.fourthCounselerUIImageView.snp.makeConstraints{
            $0.size.equalTo(80)
            $0.top.equalTo(self.view).offset(663)
            $0.leading.equalTo(firstCounselerUIImageView.snp.leading)
        }
        self.fourthCounselorUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(666)
            $0.leading.equalTo(firstCounselorUILabel.snp.leading)
        }
        self.fourthCounselorExplainUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(698)
            $0.leading.equalTo(firstCounselorExplainUILabel.snp.leading)
            $0.trailing.equalTo(firstCounselorExplainUILabel.snp.trailing)
        }
        self.fourthCounselorSelectUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(655)
            $0.leading.equalTo(firstCounselorSelectUIButton.snp.leading)
            $0.trailing.equalTo(firstCounselorSelectUIButton.snp.trailing)
        }
    }
}

