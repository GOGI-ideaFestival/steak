import UIKit
import SnapKit
import Then
import Firebase

final class HomeViewController: BaseViewController {
    
    let db = Firestore.firestore()
    
    private let firstCounselorUIImage = UIImage(named: "Pororo")
    private let secondCounselorUIImage = UIImage(named: "Eddy")
    private let thirdCounselorUIImage = UIImage(named: "Loopy")
    private let fourthCounselorUIImage = UIImage(named: "Poby")
    
    private let firstCounselorName: String = "주은"
    private let secondCounselorName: String = "준서"
    private let thirdCounselorName: String = "아인"
    private let fourthCounselorName: String = "건우"
    
    private var firstCounselorSelectUIImage: UIImage?
    private var secondCounselorSelectUIImage: UIImage?
    private var thirdCounselorSelectUIImage: UIImage?
    private var fourthCounselorSelectUIImage: UIImage?
    
    private var firstCounselorSelectName: String = ""
    private var secondCounselorSelectName: String = ""
    private var thirdCounselorSelectName: String = ""
    private var fourthCounselorSelectName: String = ""
    
    private let backUIBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    
    private let todayUILabel = UILabel().then{
        $0.text = "Today"
        $0.textColor = UIColor(rgb: 0x856752)
        $0.font = UIFont.ideaFestival(size: 60, family: .bold)
        $0.textAlignment = .center
    }
    
    private let dateUILabel = UILabel().then{
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd"
        var current_date_string = formatter.string(from: Date())
        $0.text = current_date_string
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 20, family: .light)
        $0.textAlignment = .center
    }
    
    private let firstRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xF8F5F2))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let reservationTimeUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x796551)
        $0.textAlignment = .center
        $0.font = UIFont.ideaFestival(size: 16, family: .semiBold)
        $0.backgroundColor = UIColor(rgb: 0xE3D4C3)
    }
    
    private let reservationTimeAnnouncementUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x796551)
        $0.text = "예약된 시간 : "
        $0.textAlignment = .center
        $0.font = UIFont.ideaFestival(size: 16, family: .semiBold)
    }
    
    private let counselorNameUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x937A75)
        $0.numberOfLines = 3
        $0.font = UIFont.ideaFestival(size: 16, family: .semiBold)
        $0.backgroundColor = UIColor(rgb: 0xE3D4C3)
    }
    
    private let counselorNameAnnounceUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x937A75)
        $0.numberOfLines = 3
        $0.font = UIFont.ideaFestival(size: 16, family: .semiBold)
        $0.text = "예약된 상담가 : "
    }
    
    private let counselCancelUIButton = UIButton().then{
        $0.backgroundColor = UIColor(rgb: 0xF8F5F2)
        $0.setTitle("상담 취소하기 ->", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x937A75), for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 12, family: .light)
    }
    
    private let secondRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xEADDCD))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let counselorRoomUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x937A75)
        $0.text = "상담가's room"
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
    }
    
    private let enterUIButton = UIButton().then{
        $0.backgroundColor = UIColor(rgb: 0xEADDCD)
        $0.setTitle("입장하기 ->", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0x9C8778), for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 9, family: .light)
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 5
        $0.addTarget(self, action: #selector(enterUIButtonDidTap), for: .touchUpInside)
    }
    
    private let counselingReservationUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.text = "Counseling Reservation"
        $0.font = UIFont.ideaFestival(size: 12, family: .light)
    }
    
    private let counselUIImageView = UIImageView().then{
        $0.image = UIImage(named: "counselImage")
    }
    
    private let counselingReservationUIButton = UIButton().then{
        $0.backgroundColor = UIColor(rgb: 0xF1E0CE)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 9, family: .light)
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(counselingReservationUIButtonDidTap), for: .touchUpInside)
    }
    
    private let firstCounselorUIImageView = UIImageView().then{
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 32
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.black.cgColor
    }
    private let firstCounselorNameUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x937A75)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
        $0.textAlignment = .center
    }
    
    private let secondCounselorUIImageView = UIImageView().then{
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 32
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private let secondCounselorNameUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x937A75)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
        $0.textAlignment = .center
    }
    
    private let thirdCounselerUIImageView = UIImageView().then{
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 32
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private let thirdCounselorNameUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x937A75)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
        $0.textAlignment = .center
    }
    
    private let fourthCounselerUIImageView = UIImageView().then{
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 32
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private let fourthCounselorNameUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x937A75)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
        $0.textAlignment = .center
    }
    
    override func loadView() {
        counselTime()
        counselorName()
    }
    
    override func addView() {
        counselTime()
        counselorName()
        view.addSubviews(
            todayUILabel,
            dateUILabel,
            firstRectangleUIView,
            reservationTimeUILabel,
            reservationTimeAnnouncementUILabel,
            counselorNameUILabel,
            counselorNameAnnounceUILabel,
            counselCancelUIButton,
            secondRectangleUIView,
            counselorRoomUILabel,
            enterUIButton,
            counselUIImageView,
            counselingReservationUILabel,
            counselingReservationUIButton,
            firstCounselorUIImageView,
            secondCounselorUIImageView,
            thirdCounselerUIImageView,
            fourthCounselerUIImageView,
            firstCounselorNameUILabel,
            secondCounselorNameUILabel,
            thirdCounselorNameUILabel,
            fourthCounselorNameUILabel
        )
        self.navigationItem.backBarButtonItem = backUIBarButtonItem
        backUIBarButtonItem.tintColor = UIColor(rgb: 0xAB988E)
    }
    
    override func setup() {
        firstCounselorUIImageView.image = firstCounselorUIImage
        secondCounselorUIImageView.image = secondCounselorUIImage
        thirdCounselerUIImageView.image = thirdCounselorUIImage
        fourthCounselerUIImageView.image = fourthCounselorUIImage
        
        firstCounselorNameUILabel.text = firstCounselorName
        secondCounselorNameUILabel.text = secondCounselorName
        thirdCounselorNameUILabel.text = thirdCounselorName
        fourthCounselorNameUILabel.text = fourthCounselorName
    }
    
    @objc private func enterUIButtonDidTap(_ sender: UIButton){
        let vc = ChatViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func counselingReservationUIButtonDidTap(_ sender: UIButton){        firstCounselorSelectUIImage = firstCounselorUIImage
        secondCounselorSelectUIImage = secondCounselorUIImage
        thirdCounselorSelectUIImage = thirdCounselorUIImage
        fourthCounselorSelectUIImage = fourthCounselorUIImage
        firstCounselorSelectName = firstCounselorName
        secondCounselorSelectName = secondCounselorName
        thirdCounselorSelectName = thirdCounselorName
        fourthCounselorSelectName = fourthCounselorName
        
        let vc = CounselorSelectViewController(
            firstCounselorSelectUIImage: firstCounselorSelectUIImage,
            secondCounselorSelectUIImage: secondCounselorSelectUIImage,
            thirdCounselorSelectUIImage: thirdCounselorSelectUIImage,
            fourthCounselorSelectUIImage: fourthCounselorSelectUIImage,
            firstCounselorSelectName: firstCounselorSelectName,
            secondCounselorSelectName: secondCounselorSelectName,
            thirdCounselorSelectName: thirdCounselorSelectName,
            fourthCounselorSelectName: fourthCounselorSelectName)
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setLayout() {
        self.todayUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(113)
            $0.leading.equalTo(self.view).inset(106)
        }
        self.dateUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(193)
            $0.leading.equalTo(self.view).inset(122)
        }
        self.firstRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(263)
            $0.bottom.equalTo(self.view).inset(419)
            $0.leading.equalTo(self.view).inset(25)
        }
        self.reservationTimeUILabel.snp.makeConstraints{
            $0.top.equalTo(firstRectangleUIView.snp.top).inset(20)
            $0.leading.equalTo(firstRectangleUIView).inset(110)
        }
        self.reservationTimeAnnouncementUILabel.snp.makeConstraints{
            $0.top.equalTo(reservationTimeUILabel.snp.top)
            $0.leading.equalTo(firstRectangleUIView).inset(20)
        }
        self.counselorNameAnnounceUILabel.snp.makeConstraints{
            $0.top.equalTo(firstRectangleUIView.snp.top).inset(56)
            $0.leading.equalTo(firstRectangleUIView).inset(20)
        }
        self.counselorNameUILabel.snp.makeConstraints{
            $0.top.equalTo(counselorNameAnnounceUILabel.snp.top)
            $0.leading.equalTo(firstRectangleUIView).inset(120)
        }
        self.counselCancelUIButton.snp.makeConstraints{
            $0.top.equalTo(firstRectangleUIView.snp.top).offset(132)
            $0.bottom.equalTo(firstRectangleUIView.snp.bottom).inset(15)
            $0.leading.equalTo(firstRectangleUIView).offset(20)
        }
        self.secondRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(firstRectangleUIView.snp.bottom).offset(28)
            $0.bottom.equalTo(self.view).inset(299)
            $0.leading.equalTo(firstRectangleUIView.snp.leading)
            $0.trailing.equalTo(firstRectangleUIView.snp.trailing)
        }
        self.counselorRoomUILabel.snp.makeConstraints{
            $0.top.equalTo(secondRectangleUIView.snp.top).offset(18)
            $0.leading.equalTo(secondRectangleUIView.snp.leading).offset(16)
        }
        self.enterUIButton.snp.makeConstraints{
            $0.top.equalTo(secondRectangleUIView.snp.top).offset(52)
            $0.bottom.equalTo(secondRectangleUIView.snp.bottom).inset(12)
            $0.leading.equalTo(secondRectangleUIView.snp.leading).offset(16)
            $0.trailing.equalTo(secondRectangleUIView.snp.trailing).inset(254)
        }
        self.counselUIImageView.snp.makeConstraints{
            $0.top.equalTo(secondRectangleUIView.snp.top).offset(16)
            $0.bottom.equalTo(secondRectangleUIView.snp.bottom).inset(6)
            $0.leading.equalTo(secondRectangleUIView.snp.leading).offset(213)
            $0.trailing.equalTo(secondRectangleUIView.snp.trailing).inset(8)
        }
        self.counselingReservationUILabel.snp.makeConstraints{
            $0.top.equalTo(secondRectangleUIView.snp.bottom).offset(46)
            $0.leading.equalTo(secondRectangleUIView.snp.leading)
        }
        self.counselingReservationUIButton.snp.makeConstraints{
            $0.top.equalTo(counselingReservationUILabel.snp.bottom).offset(17)
            $0.bottom.equalTo(self.view).inset(94)
            $0.leading.equalTo(firstRectangleUIView.snp.leading)
            $0.trailing.equalTo(secondRectangleUIView.snp.trailing)
        }
        self.firstCounselorUIImageView.snp.makeConstraints{
            $0.size.equalTo(60)
            $0.top.equalTo(counselingReservationUIButton.snp.top).offset(23)
            $0.leading.equalTo(counselingReservationUIButton.snp.leading).offset(20)
        }
        self.secondCounselorUIImageView.snp.makeConstraints{
            $0.size.equalTo(firstCounselorUIImageView.snp.size)
            $0.top.equalTo(firstCounselorUIImageView)
            $0.leading.equalTo(firstCounselorUIImageView.snp.trailing).offset(20)
        }
        self.thirdCounselerUIImageView.snp.makeConstraints{
            $0.size.equalTo(firstCounselorUIImageView.snp.size)
            $0.top.equalTo(firstCounselorUIImageView)
            $0.leading.equalTo(secondCounselorUIImageView.snp.trailing).offset(20)
        }
        self.fourthCounselerUIImageView.snp.makeConstraints{
            $0.size.equalTo(firstCounselorUIImageView.snp.size)
            $0.top.equalTo(firstCounselorUIImageView)
            $0.leading.equalTo(thirdCounselerUIImageView.snp.trailing).offset(20)
        }
        self.firstCounselorNameUILabel.snp.makeConstraints{
            $0.top.equalTo(counselingReservationUIButton.snp.top).offset(91)
            $0.leading.equalTo(counselingReservationUIButton.snp.leading).offset(34)
        }
        self.secondCounselorNameUILabel.snp.makeConstraints{
            $0.top.equalTo(firstCounselorNameUILabel.snp.top)
            $0.leading.equalTo(firstCounselorNameUILabel.snp.trailing).offset(51)
        }
        self.thirdCounselorNameUILabel.snp.makeConstraints{
            $0.top.equalTo(firstCounselorNameUILabel.snp.top)
            $0.leading.equalTo(secondCounselorNameUILabel.snp.trailing).offset(51)
        }
        self.fourthCounselorNameUILabel.snp.makeConstraints{
            $0.top.equalTo(firstCounselorNameUILabel.snp.top)
            $0.leading.equalTo(thirdCounselorNameUILabel.snp.trailing).offset(44)
        }
    }
    
    func counselTime() {
        if let user = Auth.auth().currentUser?.email{
            db.collection("Steak3").document(user).getDocument { snapshot, err in
                if let counselTime = snapshot?.data()?["counselTime"] as? String{
                    self.reservationTimeUILabel.text = counselTime
                }
                else{
                    self.reservationTimeUILabel.text = ""
                }
            }
        }
    }
    
    func counselorName() {
        if let user = Auth.auth().currentUser?.email{
            db.collection("Steak4").document(user).getDocument { snapshot, err in
                if let counselTime = snapshot?.data()?["counselor"] as? String{
                    self.counselorNameUILabel.text = counselTime
                }
                else{
                    self.counselorNameUILabel.text = ""
                }
            }
        }
    }
}
