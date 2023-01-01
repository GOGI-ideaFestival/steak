import UIKit
import SnapKit
import Then
import Firebase

final class ReservationViewController: BaseViewController {
    
    let db = Firestore.firestore()
    var counselorReservationUIImage: UIImage?
    var counselor: String
    var firstReservationTime: String?
    var secondReservationTime: String?
    var thirdReservationTime: String?
    var fourthReservationTime: String?
    var fifthReservationTime: String?
    var sixthReservationTime: String?
    var seventhReservationTime: String?
    
    private let counselorUIImageView = UIImageView().then{
        $0.layer.cornerRadius = 21
        $0.clipsToBounds = true
    }
    private let counselorNameUILabel = UILabel().then{
        $0.font = UIFont.ideaFestival(size: 15, family: .semiBold)
        $0.textColor = UIColor(rgb: 0x000000)
        
    }
    private let firstRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let secondRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let thirdRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let fourthRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let fifthRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let sixthRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let seventhRectangleUIView = UIView().then{
        $0.backgroundColor = (UIColor(rgb: 0xFFFFFF))
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowRadius = 6
        $0.layer.shadowOpacity = 0.6
        $0.layer.cornerRadius = 20
    }
    
    private let firstReservationTimeUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
    }
    
    private let secondReservationTimeUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
    }
    
    private let thirdReservationTimeUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
    }
    
    private let fourthReservationTimeUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
    }
    
    private let fifthReservationTimeUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
    }
    
    private let sixthReservationTimeUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
    }
    
    private let seventhReservationTimeUILabel = UILabel().then{
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 18, family: .semiBold)
    }
    
    private let firstReservationUIButton = UIButton().then{
        $0.setTitle("예약하기", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(firstReservationButtonDidTap), for: .touchUpInside)
    }
    private let secondReservationUIButton = UIButton().then{
        $0.setTitle("예약하기", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(secondReservationButtonDidTap), for: .touchUpInside)
    }
    
    private let thirdReservationUIButton = UIButton().then{
        $0.setTitle("예약하기", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(thirdReservationButtonDidTap), for: .touchUpInside)
    }
    
    private let fourthReservationUIButton = UIButton().then{
        $0.setTitle("예약하기", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(fourthReservationButtonDidTap), for: .touchUpInside)
    }
    
    private let fifthReservationUIButton = UIButton().then{
        $0.setTitle("예약하기", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(fifthReservationButtonDidTap), for: .touchUpInside)
    }
    
    private let sixthReservationUIButton = UIButton().then{
        $0.setTitle("예약하기", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(sixthReservationButtonDidTap), for: .touchUpInside)
    }
    
    private let seventhReservationUIButton = UIButton().then{
        $0.setTitle("예약하기", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 15
        $0.addTarget(self, action: #selector(seventhReservationButtonDidTap), for: .touchUpInside)
    }
    
    init(counselorReservatonUIImage: UIImage?,counselor: String,firstReservationTime: String,
         secondReservationTime: String, thirdReservationTime: String,
         fourthReservationTime: String, fifthReservationTime: String,
         sixthReservationTime: String, seventhReservationTime: String) {
        self.counselorReservationUIImage = counselorReservatonUIImage
        self.counselor = counselor
        self.firstReservationTime = firstReservationTime
        self.secondReservationTime = secondReservationTime
        self.thirdReservationTime = thirdReservationTime
        self.fourthReservationTime = fourthReservationTime
        self.fifthReservationTime = fifthReservationTime
        self.sixthReservationTime = sixthReservationTime
        self.seventhReservationTime = seventhReservationTime
        super.init()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setup() {
        counselorUIImageView.image = counselorReservationUIImage
        counselorNameUILabel.text = counselor
        firstReservationTimeUILabel.text = firstReservationTime
        secondReservationTimeUILabel.text = secondReservationTime
        thirdReservationTimeUILabel.text = thirdReservationTime
        fourthReservationTimeUILabel.text = fourthReservationTime
        fifthReservationTimeUILabel.text = fifthReservationTime
        sixthReservationTimeUILabel.text = sixthReservationTime
        seventhReservationTimeUILabel.text = seventhReservationTime
    }
    
    override func addView() {
        view.addSubviews(
            counselorUIImageView,
            counselorNameUILabel,
            firstRectangleUIView,
            secondRectangleUIView,
            thirdRectangleUIView,
            fourthRectangleUIView,
            fifthRectangleUIView,
            sixthRectangleUIView,
            seventhRectangleUIView,
            firstReservationTimeUILabel,
            secondReservationTimeUILabel,
            thirdReservationTimeUILabel,
            fourthReservationTimeUILabel,
            fifthReservationTimeUILabel,
            sixthReservationTimeUILabel,
            seventhReservationTimeUILabel,
            firstReservationUIButton,
            secondReservationUIButton,
            thirdReservationUIButton,
            fourthReservationUIButton,
            fifthReservationUIButton,
            sixthReservationUIButton,
            seventhReservationUIButton
        )
    }
    
    override func setLayout() {
        self.counselorUIImageView.snp.makeConstraints{
            $0.size.equalTo(42)
            $0.top.equalTo(self.view).offset(45)
            $0.leading.equalTo(self.view).offset(60)
        }
        self.counselorNameUILabel.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(60)
            $0.trailing.equalTo(counselorUIImageView.snp.trailing).offset(30)
        }
        self.firstRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(122)
            $0.bottom.equalTo(self.view).inset(647)
            $0.leading.equalTo(self.view).offset(22)
            $0.trailing.equalTo(self.view).inset(22)
        }
        self.secondRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(firstRectangleUIView.snp.bottom).offset(30)
            $0.bottom.equalTo(self.view).inset(545)
            $0.leading.equalTo(firstRectangleUIView.snp.leading)
            $0.trailing.equalTo(firstRectangleUIView.snp.trailing)
        }
        self.thirdRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(secondRectangleUIView.snp.bottom).offset(30)
            $0.bottom.equalTo(self.view).inset(443)
            $0.leading.equalTo(firstRectangleUIView.snp.leading)
            $0.trailing.equalTo(firstRectangleUIView.snp.trailing)
        }
        self.fourthRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(thirdRectangleUIView.snp.bottom).offset(30)
            $0.bottom.equalTo(self.view).inset(341)
            $0.leading.equalTo(firstRectangleUIView.snp.leading)
            $0.trailing.equalTo(firstRectangleUIView.snp.trailing)
        }
        self.fifthRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(fourthRectangleUIView.snp.bottom).offset(30)
            $0.bottom.equalTo(self.view).inset(239)
            $0.leading.equalTo(firstRectangleUIView.snp.leading)
            $0.trailing.equalTo(firstRectangleUIView.snp.trailing)
        }
        self.sixthRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(fifthRectangleUIView.snp.bottom).offset(30)
            $0.bottom.equalTo(self.view).inset(137)
            $0.leading.equalTo(firstRectangleUIView.snp.leading)
            $0.trailing.equalTo(firstRectangleUIView.snp.trailing)
        }
        self.seventhRectangleUIView.snp.makeConstraints{
            $0.top.equalTo(sixthRectangleUIView.snp.bottom).offset(30)
            $0.bottom.equalTo(self.view).inset(35)
            $0.leading.equalTo(firstRectangleUIView.snp.leading)
            $0.trailing.equalTo(firstRectangleUIView.snp.trailing)
        }
        self.firstReservationTimeUILabel.snp.makeConstraints{
            $0.top.equalTo(firstRectangleUIView.snp.top).offset(20)
            $0.leading.equalTo(self.view).offset(64)
        }
        self.secondReservationTimeUILabel.snp.makeConstraints{
            $0.top.equalTo(secondRectangleUIView.snp.top).offset(20)
            $0.leading.equalTo(firstReservationTimeUILabel)
        }
        self.thirdReservationTimeUILabel.snp.makeConstraints{
            $0.top.equalTo(thirdRectangleUIView.snp.top).offset(20)
            $0.leading.equalTo(firstReservationTimeUILabel)
        }
        self.fourthReservationTimeUILabel.snp.makeConstraints{
            $0.top.equalTo(fourthRectangleUIView.snp.top).offset(20)
            $0.leading.equalTo(firstReservationTimeUILabel)
        }
        self.fifthReservationTimeUILabel.snp.makeConstraints{
            $0.top.equalTo(fifthRectangleUIView.snp.top).offset(20)
            $0.leading.equalTo(firstReservationTimeUILabel)
        }
        self.sixthReservationTimeUILabel.snp.makeConstraints{
            $0.top.equalTo(sixthRectangleUIView.snp.top).offset(20)
            $0.leading.equalTo(firstReservationTimeUILabel)
        }
        self.seventhReservationTimeUILabel.snp.makeConstraints{
            $0.top.equalTo(seventhRectangleUIView.snp.top).offset(20)
            $0.leading.equalTo(firstReservationTimeUILabel)
        }
        self.firstReservationUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(143)
            $0.bottom.equalTo(self.view).inset(665)
            $0.leading.equalTo(self.view).offset(264)
            $0.trailing.equalTo(self.view).inset(48)
        }
        self.secondReservationUIButton.snp.makeConstraints{
            $0.top.equalTo(firstReservationUIButton.snp.bottom).offset(66)
            $0.bottom.equalTo(self.view).inset(563)
            $0.leading.equalTo(firstReservationUIButton.snp.leading)
            $0.trailing.equalTo(firstReservationUIButton.snp.trailing)
        }
        self.thirdReservationUIButton.snp.makeConstraints{
            $0.top.equalTo(secondReservationUIButton.snp.bottom).offset(66)
            $0.bottom.equalTo(self.view).inset(461)
            $0.leading.equalTo(firstReservationUIButton.snp.leading)
            $0.trailing.equalTo(firstReservationUIButton.snp.trailing)
        }
        self.fourthReservationUIButton.snp.makeConstraints{
            $0.top.equalTo(thirdReservationUIButton.snp.bottom).offset(66)
            $0.bottom.equalTo(self.view).inset(359)
            $0.leading.equalTo(firstReservationUIButton.snp.leading)
            $0.trailing.equalTo(firstReservationUIButton.snp.trailing)
        }
        self.fifthReservationUIButton.snp.makeConstraints{
            $0.top.equalTo(fourthReservationUIButton.snp.bottom).offset(66)
            $0.bottom.equalTo(self.view).inset(257)
            $0.leading.equalTo(firstReservationUIButton.snp.leading)
            $0.trailing.equalTo(firstReservationUIButton.snp.trailing)
        }
        self.sixthReservationUIButton.snp.makeConstraints{
            $0.top.equalTo(fifthReservationUIButton.snp.bottom).offset(66)
            $0.bottom.equalTo(self.view).inset(155)
            $0.leading.equalTo(firstReservationUIButton.snp.leading)
            $0.trailing.equalTo(firstReservationUIButton.snp.trailing)
        }
        self.seventhReservationUIButton.snp.makeConstraints{
            $0.top.equalTo(sixthReservationUIButton.snp.bottom).offset(66)
            $0.bottom.equalTo(self.view).inset(53)
            $0.leading.equalTo(firstReservationUIButton.snp.leading)
            $0.trailing.equalTo(firstReservationUIButton.snp.trailing)
        }
    }
    
    @objc func firstReservationButtonDidTap(_ sender: UIButton){
        let reservation = UIAlertController(title: "", message: "10:00 로 예약하시겠습니까??", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "확인", style: .default){ [self] _ in
            sendFirstReservationTime()
            self.navigationController?.popToRootViewController(animated: false)
        }
        let cancelAction = (UIAlertAction(title: "취소", style: .destructive))
        reservation.addAction(cancelAction)
        reservation.addAction(okayAction)
        self.present(reservation, animated: false, completion: nil)
    }
    
    @objc func secondReservationButtonDidTap(_ sender: UIButton){
        let reservation = UIAlertController(title: "", message: "11:00 로 예약하시겠습니까??", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "확인", style: .default){ [self] _ in
            sendSecondReservationTime()
            self.navigationController?.popToRootViewController(animated: false)
        }
        let cancelAction = (UIAlertAction(title: "취소", style: .destructive))
        reservation.addAction(cancelAction)
        reservation.addAction(okayAction)
        present(reservation, animated: false, completion: nil)
    }
    
    @objc func thirdReservationButtonDidTap(_ sender: UIButton){
        let reservation = UIAlertController(title: "", message: "15:00 로 예약하시겠습니까??", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "확인", style: .default){ [self] _ in
            sendThirdReservationTime()
            self.navigationController?.popToRootViewController(animated: false)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive)
        reservation.addAction(cancelAction)
        reservation.addAction(okayAction)
        present(reservation, animated: false, completion: nil)
    }
    
    @objc func fourthReservationButtonDidTap(_ sender: UIButton){
        let reservation = UIAlertController(title: "", message: "16:00 로 예약하시겠습니까??", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "확인", style: .default){ [self] _ in
            sendFourthReservationTime()
            self.navigationController?.popToRootViewController(animated: false)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive)
        reservation.addAction(cancelAction)
        reservation.addAction(okayAction)
        present(reservation, animated: false, completion: nil)
    }
    
    @objc func fifthReservationButtonDidTap(_ sender: UIButton){
        let reservation = UIAlertController(title: "", message: "17:00 로 예약하시겠습니까??", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "확인", style: .default){ [self] _ in
            sendFifthReservationTime()
            self.navigationController?.popToRootViewController(animated: false)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive)
        reservation.addAction(cancelAction)
        reservation.addAction(okayAction)
        present(reservation, animated: false, completion: nil)
    }
    
    @objc func sixthReservationButtonDidTap(_ sender: UIButton){
        let reservation = UIAlertController(title: "", message: "19:00 로 예약하시겠습니까??", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "확인", style: .default){ [self] _ in
            sendSixthReservationTime()
            self.navigationController?.popToRootViewController(animated: false)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive)
        reservation.addAction(cancelAction)
        reservation.addAction(okayAction)
        present(reservation, animated: false, completion: nil)
        
    }
    
    @objc func seventhReservationButtonDidTap(_ sender: UIButton){
        let reservation = UIAlertController(title: "", message: "20:00 로 예약하시겠습니까??", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "확인", style: .default){ [self] _ in
            sendSeventhReservationTime()
            self.navigationController?.popToRootViewController(animated: false)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive)
        reservation.addAction(cancelAction)
        reservation.addAction(okayAction)
        present(reservation, animated: false, completion: nil)
    }
    
    func sendFirstReservationTime(){
        let counselorName = counselor
        if let first = firstReservationTime,
            let user = Auth.auth().currentUser?.email
        {
            db.collection("Steak3").document(user).setData(["counselTime" : first])
            db.collection("Steak4").document(user).setData(["counselor" : counselorName])
        }
    }
    
    func sendSecondReservationTime(){
        let counselorName = counselor
        if let second = secondReservationTime,
            let user = Auth.auth().currentUser?.email
        {
            db.collection("Steak3").document(user).setData(["counselTime" : second])
            db.collection("Steak4").document(user).setData(["counselor" : counselorName])
        }
    }
    
    func sendThirdReservationTime(){
        let counselorName = counselor
        if let third = thirdReservationTime,
            let user = Auth.auth().currentUser?.email
        {
            db.collection("Steak3").document(user).setData(["counselTime" : third])
            db.collection("Steak4").document(user).setData(["counselor" : counselorName])
        }
    }
    
    func sendFourthReservationTime(){
        let counselorName = counselor
        if let fourth = fourthReservationTime,
            let user = Auth.auth().currentUser?.email
        {
            db.collection("Steak3").document(user).setData(["counselTime" : fourth])
            db.collection("Steak4").document(user).setData(["counselor" : counselorName])
        }
    }
    
    func sendFifthReservationTime(){
        let counselorName = counselor
        if let fifth = fifthReservationTime,
            let user = Auth.auth().currentUser?.email
        {
            db.collection("Steak3").document(user).setData(["counselTime" : fifth])
            db.collection("Steak4").document(user).setData(["counselor" : counselorName])
        }
    }
    
    func sendSixthReservationTime(){
        let counselorName = counselor
        if let sixth = sixthReservationTime,
            let user = Auth.auth().currentUser?.email
        {
            db.collection("Steak3").document(user).setData(["counselTime" : sixth])
            db.collection("Steak4").document(user).setData(["counselor" : counselorName])
        }
    }
    
    func sendSeventhReservationTime(){
        let counselorName = counselor
        if let seventh = seventhReservationTime,
            let user = Auth.auth().currentUser?.email
        {
            db.collection("Steak3").document(user).setData(["counselTime" : seventh])
            db.collection("Steak4").document(user).setData(["counselor" : counselorName])
        }
    }
}

