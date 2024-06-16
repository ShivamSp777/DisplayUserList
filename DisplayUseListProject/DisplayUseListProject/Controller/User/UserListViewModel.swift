
import Foundation

class UserListViewModel {
    
   weak var delegate: NotifyUserResonse?
    
    func getUserListData() {
        APIManager.shared.getDataFromApi(APIConstants.userUrl) { userdata in
                self.delegate?.getUserDataSuccessfully(userData:  userdata.data ?? [])
        }
    }
    
}
