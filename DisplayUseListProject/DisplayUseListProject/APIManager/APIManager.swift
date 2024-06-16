
import Foundation

// MARK: - APIManager Singleton class
class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    func getDataFromApi(_ url: String, completionHandler: @escaping (UserBaseModel) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { userData, userResponse,
            error in
            if error == nil {
                if let userData = userData {
                    
                    do {
                        let jsonData = try JSONDecoder().decode(UserBaseModel.self, from: userData)
                        completionHandler(jsonData)
                    } catch (let error) {
                        print("Getting error", error)
                    }
                }
            }
        }
        task.resume()
    }
    
}
