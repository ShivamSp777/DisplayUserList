import UIKit

protocol NotifyUserResonse: AnyObject {
    func getUserDataSuccessfully(userData: [UserData])
}

class UserViewController: UIViewController {
    // MARK: - IBOutlets property
    @IBOutlet weak var userListTableView: UITableView!
    
      // MARK: - Instance properties
    let userListVM = UserListViewModel()
    var usersData: [UserData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registeCell()
        userListVM.delegate = self
        self.userListVM.getUserListData()
    }
      // MARK: - Register cell
    private func registeCell() {
        userListTableView.register(UINib(nibName: AppConstants.userCell, bundle: nil), forCellReuseIdentifier: AppConstants.userCell)
    }
}

  // MARK: - UITableViewDataSource method
extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.userCell, for: indexPath) as? UserTableViewCell
        let data = usersData[indexPath.row]
        cell?.setupUI(data: data)
        return cell ?? UITableViewCell()
    }
}

  // MARK: - NotifyUserResonse Protocol
extension UserViewController: NotifyUserResonse {
    func getUserDataSuccessfully(userData: [UserData]) {
        self.usersData = userData
        DispatchQueue.main.async {
            self.userListTableView.reloadData()
        }
    }
}

