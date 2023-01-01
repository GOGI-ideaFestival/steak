import UIKit
import Then
import SnapKit
import Firebase

final class ChatTableViewCell: UITableViewCell{
    
    let db = Firestore.firestore()
    var messages: [Message] = []
    
    private let messageUILabel = UILabel().then{
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.textColor = UIColor(rgb: 0x000000)
        $0.font = UIFont.ideaFestival(size: 11, family: .bold)
        $0.textAlignment = .center
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(message: Message){
        messageUILabel.text = message.messageContent
        
        if message.sender == Auth.auth().currentUser?.email{
            messageUILabel.backgroundColor = UIColor(rgb: 0xE4CCC4)
        }else{
            messageUILabel.backgroundColor = UIColor(rgb: 0xE6E5EB)
        }
    }

    private func setLayout() {
        contentView.addSubviews(messageUILabel)
        self.messageUILabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalTo(self.contentView.snp.top)
            $0.bottom.equalTo(self.contentView.snp.bottom)
            $0.leading.equalTo(self.contentView).offset(20)
            $0.trailing.equalTo(self.contentView).inset(20)
        }

    }
}

