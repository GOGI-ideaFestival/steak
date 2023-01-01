import UIKit
import Foundation
import Firebase

final class ChatViewController: BaseViewController{
    
    let db = Firestore.firestore()
    var messages: [Message] = []
    
    private let messageTableView: UITableView = {
        let messageTableView = UITableView()
        messageTableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "ReusableCell")
        return messageTableView
    }()
    
    private let sendUIButton = UIButton().then{
        $0.setTitle("보내기", for: .normal)
        $0.titleLabel?.font = UIFont.ideaFestival(size: 11, family: .semiBold)
        $0.titleLabel?.textColor = UIColor(rgb: 0xFFFFFF)
        $0.backgroundColor = UIColor(rgb: 0xAB988E)
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
    }
    
    private let messageUITextField = UITextField().then{
        $0.placeholder = "메시지를 입력해주세요"
        $0.layer.borderColor = UIColor(rgb: 0xAB988E).cgColor
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10
    }
    
    
    override func addView() {
        view.addSubviews(
            messageTableView,
            sendUIButton,
            messageUITextField
        )
        hideKeyboardWhenTappedAround()
    }
    
    override func setup() {
        messageTableView.delegate = self
        messageTableView.dataSource = self
        loadMessages()
    }
    
    override func setLayout() {
        self.messageTableView.snp.makeConstraints{
            $0.top.equalTo(self.view)
            $0.bottom.equalTo(self.view)
            $0.leading.equalTo(self.view)
            $0.trailing.equalTo(self.view)
        }
        self.sendUIButton.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(440)
            $0.height.equalTo(45)
            $0.leading.equalTo(messageUITextField.snp.trailing).offset(5)
            $0.trailing.equalTo(self.view).inset(10)
        }
        self.messageUITextField.snp.makeConstraints{
            $0.top.equalTo(sendUIButton.snp.top)
            $0.bottom.equalTo(sendUIButton.snp.bottom)
            $0.leading.equalTo(self.view).offset(10)
            $0.trailing.equalTo(self.view).inset(60)
        }
    }
    
    @objc func sendMessage(_ sender: UIButton){
        if let messageContent = messageUITextField.text,
           let messageSender = Auth.auth().currentUser?.email{
            db.collection("Steak")
                .addDocument(data: [
                    "sender": messageSender,
                    "messageContent": messageContent,
                    "sendTime": Date().timeIntervalSince1970
                ]){(error) in
                    if let e = error {
                        print(e.localizedDescription)
                    }else{
                        print("Success save data")
                        DispatchQueue.main.async{
                            self.messageUITextField.text = ""
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableViewCell, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        let messageCell = messageTableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)as! ChatTableViewCell
        
        messageCell.configure(message: message)
        
        return messageCell
        
    }
    
    private func loadMessages(){
        db.collection("Steak")
            .order(by: "sendTime")
            .addSnapshotListener{(querySnapshot, error) in
                self.messages = []
                if let e = error{
                    print(e.localizedDescription)
                }else {
                    if let snapshotDocuments = querySnapshot?.documents.suffix(10) {
                        snapshotDocuments.forEach{(doc) in
                            print(doc.data())
                            let data = doc.data()
                            if let sender = data["sender"] as? String,
                               let messageContent = data["messageContent"] as? String,
                               let sendTime = data["sendTime"]
                            {
                                self.messages.append(Message(sender: sender, messageContent: messageContent, sendTime: "\(sendTime)"))
                                
                                DispatchQueue.main.async {
                                    self.messageTableView.reloadData()
                                    self.messageTableView.scrollToRow(at: IndexPath(row: self.messages.count-1, section: 0), at: .top, animated: false)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

extension ChatViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageCell: ChatTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ChatTableViewCell
        
        messageCell.configure(message: messages[indexPath.row])
        return messageCell
    }
}


