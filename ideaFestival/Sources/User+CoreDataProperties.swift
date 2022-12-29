import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var pw: String?
    @NSManaged public var role: String?
    @NSManaged public var nickname: String?
    @NSManaged public var profileImage: Data
}

extension User : Identifiable {

}
