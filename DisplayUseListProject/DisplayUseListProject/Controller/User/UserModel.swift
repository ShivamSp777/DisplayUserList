
import Foundation

struct UserBaseModel: Codable {

    let page: Int?
    let per_page: Int?
    let total: Int?
    let total_pages: Int?
    let data: [UserData]?
}

struct UserData: Codable {
    
    let id: Int
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
    
}
