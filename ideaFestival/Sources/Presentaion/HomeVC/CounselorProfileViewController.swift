import UIKit
import SnapKit
import Then

final class CounselorProfileViewController: BaseViewController {
    
    private let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    var counselor: String
    var counselorUIImage: UIImage?
    var songRecommendation: String
    var songRecommendationURL: String
    
    let firstReservationAvailableTime: String = "10 : 00"
    let secondReservationAvailableTime: String = "11 : 00"
    let thirdReservationAvailableTime: String = "15 : 00"
    let fourthReservationAvailableTime: String = "16 : 00"
    let fifthReservationAvailableTime: String = "17 : 00"
    let sixthReservationAvailableTime: String = "19 : 00"
    let seventhReservationAvailableTime: String = "20 : 00"
    
    var counselorReservationUIImage: UIImage?
    var firstReservationTime: String = ""
    var secondReservationTime: String = ""
    var thirdReservationTime: String = ""
    var fourthReservationTime: String = ""
    var fifthReservationTime: String = ""
    var sixthReservationTime: String = ""
    var seventhReservationTime: String = ""
    
    init(counselor: String, counselorUIImage: UIImage?, songRecommendation: String, songRecommendationURL: String) {
        self.counselor = counselor
        self.counselorUIImage = counselorUIImage
        self.songRecommendation = songRecommendation
        self.songRecommendationURL = songRecommendationURL
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let counselorUIImageView = UIImageView().then{
        $0.layer.cornerRadius = 90
        $0.clipsToBounds = true
    }
    
    private let counselorNameUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
    }
    
    private let counselorSongRecommendationUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x636363)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 15)
    }
    
    private let firstRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.cornerRadius = 20
        $0.layer.shadowOffset = CGSize.zero
    }
    
    private let musicUIImageView = UIImageView().then{
        $0.image = UIImage(systemName: "music.note")
        $0.tintColor = .black
    }
    
    private lazy var musicLinkUIButton = UIButton().then{
        $0.titleLabel?.font = UIFont.ideaFestival(size: 11, family: .semiBold)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = UIColor.white
        $0.addTarget(self, action: #selector(openSafariAction), for: .touchUpInside)
    }
    
    private let reservationUILabel = UILabel().then{
        $0.text = "상담 예약하기"
        $0.textColor = UIColor(rgb: 0x636363)
        $0.font = UIFont(name: "JainiPurva-Regular", size: 15)
    }
    
    private let reservationAvailableTimeUILabel = UILabel().then{
        $0.text = "예약 가능 시간"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 12, family: .semiBold)
    }
    
    private let reservationAvailabeUIButton = UIButton().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.cornerRadius = 20
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize.zero
        $0.addTarget(self, action: #selector(counselUIButtonDidTap), for: .touchUpInside)
    }
    
    private let firtstResevationUILabel = UILabel().then{
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.textAlignment = .center
    }
    
    private let secondResevationUILabel = UILabel().then{
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.textAlignment = .center
    }
    
    private let thirdResevationUILabel = UILabel().then{
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.textAlignment = .center
    }
    
    private let fourthResevationUILabel = UILabel().then{
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.textAlignment = .center
    }
    
    private let fifthResevationUILabel = UILabel().then{
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.textAlignment = .center
    }
    
    private let sixthResevationUILabel = UILabel().then{
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.textAlignment = .center
    }
    
    private let seventhResevationUILabel = UILabel().then{
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.textColor = UIColor(rgb: 0xFFFFFF)
        $0.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.textAlignment = .center
    }
    
    override func setup() {
        counselorNameUILabel.text = counselor
        counselorUIImageView.image = counselorUIImage
        counselorSongRecommendationUILabel.text = "\(counselor)의 노래 추천!"
        musicLinkUIButton.setTitle(songRecommendation, for: .normal)
        
        firtstResevationUILabel.text = firstReservationAvailableTime
        secondResevationUILabel.text = secondReservationAvailableTime
        thirdResevationUILabel.text = thirdReservationAvailableTime
        fourthResevationUILabel.text = fourthReservationAvailableTime
        fifthResevationUILabel.text = fifthReservationAvailableTime
        sixthResevationUILabel.text = sixthReservationAvailableTime
        seventhResevationUILabel.text = seventhReservationAvailableTime
    }
    
    override func addView() {
        view.addSubviews(
            counselorUIImageView,
            counselorNameUILabel,
            counselorSongRecommendationUILabel,
            firstRectangleUIView,
            musicUIImageView,
            musicLinkUIButton,
            reservationUILabel,
            reservationAvailabeUIButton,
            reservationAvailableTimeUILabel,
            firtstResevationUILabel,
            secondResevationUILabel,
            thirdResevationUILabel,
            fourthResevationUILabel,
            fifthResevationUILabel,
            sixthResevationUILabel,
            seventhResevationUILabel
        )
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0xAB988E)
    }
    
    @objc private func openSafariAction(_ sender: UIButton){
        guard let url = URL(string: songRecommendationURL),
              UIApplication.shared.canOpenURL(url)else{return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc private func counselUIButtonDidTap(_ sender: UIButton){
        
        counselorReservationUIImage = counselorUIImage
        firstReservationTime = firstReservationAvailableTime
        secondReservationTime = secondReservationAvailableTime
        thirdReservationTime = thirdReservationAvailableTime
        fourthReservationTime = fourthReservationAvailableTime
        fifthReservationTime = fifthReservationAvailableTime
        sixthReservationTime = sixthReservationAvailableTime
        seventhReservationTime = seventhReservationAvailableTime
        
        let vc = ReservationViewController(
            counselorReservatonUIImage: counselorReservationUIImage,
            counselor: counselor,
            firstReservationTime: firstReservationTime,
            secondReservationTime: secondReservationTime,
            thirdReservationTime: thirdReservationTime,
            fourthReservationTime: fourthReservationTime,
            fifthReservationTime: fifthReservationTime,
            sixthReservationTime: sixthReservationTime,
            seventhReservationTime: seventhReservationTime)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setLayout() {
        self.counselorUIImageView.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(89)
            $0.centerX.equalTo(self.view)
            $0.width.equalTo(180)
            $0.height.equalTo(180)
        }
        self.counselorNameUILabel.snp.makeConstraints{
            $0.top.equalTo(self.counselorUIImageView.snp.bottom).offset(11)
            $0.centerX.equalTo(self.counselorUIImageView.snp.centerX)
        }
        self.counselorSongRecommendationUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(397)
            $0.leading.equalTo(self.view).offset(35)
        }
        self.firstRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(431)
            $0.leading.trailing.equalTo(self.view).inset(22)
            $0.height.equalTo(41)
        }
        self.musicUIImageView.snp.makeConstraints{
            $0.top.equalTo(self.firstRectangleUIView.snp.top).offset(11)
            $0.leading.equalTo(self.firstRectangleUIView.snp.leading).offset(21)
        }
        self.musicLinkUIButton.snp.makeConstraints{
            $0.top.equalTo(self.firstRectangleUIView.snp.top).offset(10)
            $0.leading.equalTo(self.musicUIImageView.snp.trailing).offset(14)
        }
        self.reservationUILabel.snp.makeConstraints{
            $0.top.equalTo(self.firstRectangleUIView.snp.bottom).offset(40)
            $0.leading.equalTo(self.view).offset(35)
        }
        self.reservationAvailableTimeUILabel.snp.makeConstraints{
            $0.top.equalTo(self.reservationAvailabeUIButton.snp.top).offset(16)
            $0.leading.equalTo(self.reservationAvailabeUIButton.snp.leading).offset(22)
        }
        self.reservationAvailabeUIButton.snp.makeConstraints{
            $0.top.equalTo(self.reservationUILabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(self.view).inset(22)
            $0.height.equalTo(150)
        }
        self.firtstResevationUILabel.snp.makeConstraints{
            $0.top.equalTo(self.reservationAvailableTimeUILabel.snp.bottom).offset(17)
            $0.leading.equalTo(self.reservationAvailabeUIButton.snp.leading).offset(22)
            $0.width.equalTo(72)
            $0.height.equalTo(26)
        }
        self.secondResevationUILabel.snp.makeConstraints{
            $0.top.equalTo(firtstResevationUILabel)
            $0.leading.equalTo(firtstResevationUILabel.snp.trailing).offset(7)
            $0.width.equalTo(firtstResevationUILabel)
            $0.height.equalTo(firtstResevationUILabel)
        }
        self.thirdResevationUILabel.snp.makeConstraints{
            $0.top.equalTo(firtstResevationUILabel)
            $0.leading.equalTo(secondResevationUILabel.snp.trailing).offset(7)
            $0.width.equalTo(firtstResevationUILabel)
            $0.height.equalTo(firtstResevationUILabel)
        }
        self.fourthResevationUILabel.snp.makeConstraints{
            $0.top.equalTo(firtstResevationUILabel)
            $0.leading.equalTo(thirdResevationUILabel.snp.trailing).offset(7)
            $0.width.equalTo(firtstResevationUILabel)
            $0.height.equalTo(firtstResevationUILabel)
        }
        self.fifthResevationUILabel.snp.makeConstraints{
            $0.top.equalTo(firtstResevationUILabel.snp.bottom).offset(17)
            $0.leading.equalTo(firtstResevationUILabel.snp.leading)
            $0.width.equalTo(firtstResevationUILabel)
            $0.height.equalTo(firtstResevationUILabel)
        }
        self.sixthResevationUILabel.snp.makeConstraints{
            $0.top.equalTo(fifthResevationUILabel)
            $0.leading.equalTo(fifthResevationUILabel.snp.trailing).offset(7)
            $0.width.equalTo(firtstResevationUILabel)
            $0.height.equalTo(firtstResevationUILabel)
        }
        self.seventhResevationUILabel.snp.makeConstraints{
            $0.top.equalTo(fifthResevationUILabel)
            $0.leading.equalTo(sixthResevationUILabel.snp.trailing).offset(7)
            $0.width.equalTo(firtstResevationUILabel)
            $0.height.equalTo(firtstResevationUILabel)
        }
    }
}





