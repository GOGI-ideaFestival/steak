import UIKit
import SnapKit
import Then

final class MainViewController: UITabBarController {
 
    private let profileVC = ProfileViewController().then{
        $0.title = ""
        $0.tabBarItem.image = UIImage(systemName: "person.circle")
        $0.navigationItem.largeTitleDisplayMode = .always
    }
    
    private let homeVC = HomeViewController().then{
        $0.title = ""
        $0.tabBarItem.image = UIImage(systemName: "house")
        $0.navigationItem.largeTitleDisplayMode = .always
    }
    
    private let announceVC = AnnounceViewController().then{
        $0.title = ""
        $0.tabBarItem.image = UIImage(systemName: "megaphone")
        $0.navigationItem.largeTitleDisplayMode = .always
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let navigationProfile = profileVC
        let navigationHome = homeVC
        let navigationAnnounce = announceVC
        
        setViewControllers([navigationProfile, navigationHome, navigationAnnounce], animated: false)
    }
}

